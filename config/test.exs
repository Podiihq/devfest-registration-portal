use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :devfest_registration_app, DevfestRegistrationAppWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :devfest_registration_app, DevfestRegistrationApp.Repo,
  username: "postgres",
  password: "postgres",
  database: "devfest_registration_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
