defmodule Auth2024.Repo do
  use Ecto.Repo,
    otp_app: :auth2024,
    adapter: Ecto.Adapters.Postgres
end
