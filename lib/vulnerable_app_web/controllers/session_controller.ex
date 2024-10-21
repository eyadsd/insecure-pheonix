defmodule VulnerableAppWeb.SessionController do
  use VulnerableAppWeb, :controller
  require Logger

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"username" => username, "password" => password}) do
    # Vulnerability: Logging sensitive data (password)
    Logger.info("Login attempt: username=#{username}, password=#{password}")

    # Simulating login behavior
    if username == "admin" and password == "secret" do
      # Vulnerability: No session ID rotation after successful login
      # The session ID remains the same, leaving it vulnerable to session fixation attacks.
      conn

      |> configure_session(renew: true)
      |> put_session(:user_id, "admin")
      |> put_flash(:info, "Welcome, #{username}!")
      |> redirect(to: "/dashboard")
    else
      conn
      |> put_flash(:error, "Invalid credentials")
      |> redirect(to: "/login")
    end
  end
end
