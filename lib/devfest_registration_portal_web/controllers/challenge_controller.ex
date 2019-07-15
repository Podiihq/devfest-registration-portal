defmodule DevfestRegistrationPortalWeb.ChallengeController do
  use DevfestRegistrationPortalWeb, :controller
  alias DevfestRegistrationPortal.Codelab

  def new(conn, _param) do
    changeset = Codelab.changeset(%Codelab{}, %{})
    render(conn, "new.html", changeset: changeset)
  end
end
