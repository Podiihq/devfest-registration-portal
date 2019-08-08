defmodule DevfestRegistrationPortalWeb.ChallengeController do
  use DevfestRegistrationPortalWeb, :controller
  alias DevfestRegistrationPortalWeb
  plug :authenticate_user when action in [:index]

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
