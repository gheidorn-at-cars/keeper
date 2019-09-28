# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :keeper,
  ecto_repos: [Keeper.Repo]

# Configures the endpoint
config :keeper, KeeperWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1SoMjSag2TGuB6x5GY0f+OUSlN2Qs1kzu5+rMqucOKzDc1Qwoggti8vGKsrgXFb2",
  render_errors: [view: KeeperWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Keeper.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix,
  json_library: Jason,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
