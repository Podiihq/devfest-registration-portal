defmodule DevfestRegistrationApp.Repo do
  use Ecto.Repo,
    otp_app: :devfest_registration_app,
    adapter: Ecto.Adapters.Postgres
end
