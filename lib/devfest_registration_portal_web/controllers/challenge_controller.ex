defmodule DevfestRegistrationPortalWeb.ChallengeController do
  use DevfestRegistrationPortalWeb, :controller

  alias DevfestRegistrationPortal.Codelab

  def new(conn, _param) do
    changeset = Codelab.changeset(%Codelab{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
