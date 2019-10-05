use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :keeper, KeeperWeb.Endpoint,
  http: [port: 4002],
  server: false,
  live_view: [
    signing_salt: "Awq6ke194GoAGWqiYrfhjOAPR4xhoDClnSsB0GuYPdE623R6Qw8rNHPEe+J/ESpX"
  ]

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :keeper, Keeper.Repo,
  username: "postgres",
  password: System.get_env("POSTGRES_PASSWORD") || "postgres",
  database: "keeper_test",
  hostname: System.get_env("POSTGRES_HOSTNAME") || "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
