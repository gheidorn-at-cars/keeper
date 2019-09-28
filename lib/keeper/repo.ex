defmodule Keeper.Repo do
  use Ecto.Repo,
    otp_app: :keeper,
    adapter: Ecto.Adapters.Postgres
end
