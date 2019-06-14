use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :devfest_registration_portal, DevfestRegistrationPortalWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :phoenix_integration,
  endpoint: DevfestRegistrationPortalWeb.Endpoint

# Configure your database
config :devfest_registration_portal, DevfestRegistrationPortal.Repo,
  username: "postgres",
  password: "postgres",
  database: "devfest_registration_portal_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
