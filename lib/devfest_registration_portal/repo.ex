defmodule DevfestRegistrationPortal.Repo do
  use Ecto.Repo,
    otp_app: :devfest_registration_portal,
    adapter: Ecto.Adapters.Postgres
end
