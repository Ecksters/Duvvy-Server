# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :duvvy,
  ecto_repos: [Duvvy.Repo]

# Configures the endpoint
config :duvvy, DuvvyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jXkVmFDCrFqIlDK3Esn4oLkayL8W77ftxKUHfJeI7dnPIKEj+OB3xSnyxd+LQMlz",
  render_errors: [view: DuvvyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Duvvy.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
