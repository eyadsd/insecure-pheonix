defmodule VulnerableAppWeb.VulnerableSQLController do
  use VulnerableAppWeb, :controller
  alias VulnerableApp.Repo
  alias Ecto.Adapters.SQL

  # Unsafe: Directly interpolating user input in the SQL query
  def unsafe_query(conn, %{"input" => input}) do
    query = "SELECT * FROM users WHERE username = '#{input}'"
    result = Repo.query(query)

    send_resp(conn, 200, "Query Result: #{inspect(result)}")
  end

  # Unsafe: Building the query dynamically with user input
  def unsafe_dynamic_query(conn, %{"input" => input}) do
    query = "SELECT * FROM orders WHERE order_number = " <> input
    result = SQL.query(Repo, query)

    send_resp(conn, 200, "Dynamic Query Result: #{inspect(result)}")
  end
end
