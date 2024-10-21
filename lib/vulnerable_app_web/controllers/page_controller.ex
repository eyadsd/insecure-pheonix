defmodule VulnerableAppWeb.PageController do
  use VulnerableAppWeb, :controller
  require Logger

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def index(conn, _params) do
    # Log user params, which could contain sensitive info
    Logger.info("Received params: #{inspect(conn.params)}")
    text(conn, "Welcome to the vulnerable app!")
  end

  def set_cookie(conn, %{"username" => username}) do
    # Vulnerable: directly inserting unsanitized user input into the "Set-Cookie" header
    cookie_value = "user=" <> username <> "; Path=/; HttpOnly"

    # Manually setting the header instead of using Plug.Conn.put_resp_cookie
    conn
    |> put_resp_header("set-cookie", cookie_value)
    |> send_resp(200, "Cookie set for " <> username)
  end

  @spec crash(any(), any()) :: none()
  def crash(_conn, _params) do
    raise "Test error: crashing app!"
  end
end
