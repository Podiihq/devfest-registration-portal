defmodule DevfestRegistrationPortalWeb.ChallengeController do
  use DevfestRegistrationPortalWeb, :controller

  alias DevfestRegistrationPortal.Codelab
  alias DevfestRegistrationPortal.Codelabs

  def new(conn, _param) do
    changeset = Codelab.changeset(%Codelab{})
    render(conn, "new.html", changeset: changeset)
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, _params) do
    codelabs = Codelabs.list_all_codelabs()
    render(conn, "show.html", codelabs: codelabs)
  end

  def create(conn, %{"codelab" => codelab_params}) do
    case Codelabs.create_codelab(codelab_params) do
      {:ok, codelab} ->
        conn
        |> put_flash(:info, "#{codelab.name} created!")
        |> redirect(to: Routes.challenge_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
