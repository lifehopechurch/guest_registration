# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :guest_registration,
  ecto_repos: [GuestRegistration.Repo],
  admin_auth:
    [
      username: "admin",
      password: System.get_env("ADMIN_AUTH_PW") || "admin",
      realm: "Admin Area"
    ]

# Configures the endpoint
config :guest_registration, GuestRegistration.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R2VkWHFYUKDBFPyasmh2/1lABc3RTF7FA/nY1J8LQK3FME4AsawFsbfuX84vnOxF",
  render_errors: [view: GuestRegistration.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GuestRegistration.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
