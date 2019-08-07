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

  def edit(conn, %{"id" => id}) do
    codelab = Codelabs.get_codelab(id)
    changeset = Codelabs.change_codelab(codelab)
    render(conn, "edit.html", codelab: codelab, changeset: changeset)
  end

  def update(conn, %{"id" => id, "codelab" => codelab_params}) do
    codelab = Codelabs.get_codelab(id)

    case Codelabs.update_codelab(codelab, codelab_params) do
      {:ok, codelab} ->
        conn
        |> put_flash(:info, "#{codelab.name} codelab updated successfully!!")
        |> redirect(to: Routes.challenge_path(conn, :index))

      {:error, changeset} ->
        conn
        |> render("edit.html", changeset: changeset, codelab: codelab)
    end
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
