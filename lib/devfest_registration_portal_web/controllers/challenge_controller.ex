defmodule DevfestRegistrationPortalWeb.ChallengeController do
  use DevfestRegistrationPortalWeb, :controller

  alias DevfestRegistrationPortal.Codelab
  alias DevfestRegistrationPortal.Codelabs

  def new(conn, _param) do
    changeset = Codelab.changeset(%Codelab{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, %{"codelab" => codelab_params}) do
    {:ok, codelab} = Codelabs.create_codelab(codelab_params)

    conn
    |> put_flash(:info, "#{codelab.name} created!")
    |> redirect(to: Routes.challenge_path(conn, :index))
  end
end
