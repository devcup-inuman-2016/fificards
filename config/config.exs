# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :fificards,
  ecto_repos: [Fificards.Repo]

# Configures the endpoint
config :fificards, Fificards.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Y8NvTWTyhGZCkYtvgBhVqS6nkdkNzXq90zxJeKU4j7nxjfGsi2hvR+vstj/WerTf",
  render_errors: [view: Fificards.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Fificards.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
