# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :exgithub,
  ecto_repos: [Exgithub.Repo]

# Custom
config :exgithub, Exgithub.Repositories.Get, github_adapter: Exgithub.Github.Client

config :exgithub, ExgithubWeb.Auth.Guardian,
  issuer: "exgithub",
  secret_key: "zumB0oMjdhQcLw1HHz3aG+AgRmsXFNCtmdg7uZqOBOVqVFc7UII3Pjwgwkz0xxk3"

config :exgithub, ExgithubWeb.Auth.Pipeline,
  module: ExgithubWeb.Auth.Guardian,
  error_handler: ExgithubWeb.Auth.ErrorHandler

# Configures the endpoint
config :exgithub, ExgithubWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hFoHxW2kVuh4086CQD7lTzB+kG2ftS2i1hHtfCXe0rqwOr0ENlmdDgXyxDmlDoy+",
  render_errors: [view: ExgithubWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Exgithub.PubSub,
  live_view: [signing_salt: "nJ/mUxCQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
