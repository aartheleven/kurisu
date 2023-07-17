defmodule Kurisu.Repo do
  use Ecto.Repo,
    otp_app: :kurisu,
    adapter: Ecto.Adapters.Postgres
end
