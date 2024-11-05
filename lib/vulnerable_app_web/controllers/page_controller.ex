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
 # Example 1: Vulnerable HTML rendering using html/2
 def html_resp(conn, %{"i" => i}) do
  # Vulnerable to XSS if `i` contains malicious JavaScript.
  html(conn, "<html><head>#{i}</head></html>")
end

# Example 2: Raw HTML injection vulnerability using Phoenix.HTML.raw/1
def raw_resp(conn, %{"user_input" => user_input}) do
  # Vulnerable to XSS since `raw` bypasses HTML escaping.
  safe_html = Phoenix.HTML.raw(user_input)

  conn
  |> put_resp_content_type("text/html")
  |> send_resp(200, "<html><body>#{safe_html}</body></html>")
end

# Example 3: File upload content-type vulnerability
def view_photo(conn, %{"filename" => filename}) do
  case ImgServer.get(filename) do
    %{content_type: content_type, bin: bin} ->
      # Vulnerable to XSS if `content_type` is set to `text/html`
      conn
      |> put_resp_content_type(content_type)
      |> send_resp(200, bin)

    _ ->
      conn
      |> put_resp_content_type("text/html")
      |> send_resp(404, "Not Found")
  end
end
end
