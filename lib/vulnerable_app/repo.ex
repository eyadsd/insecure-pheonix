defmodule VulnerableApp.Repo do
  use Ecto.Repo,
    otp_app: :vulnerable_app,
    adapter: Ecto.Adapters.Postgres
end
