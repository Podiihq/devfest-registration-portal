defmodule DevfestRegistrationPortalWeb.ChallengeController do
  use DevfestRegistrationPortalWeb, :controller

  alias DevfestRegistrationPortal.Codelab
  alias DevfestRegistrationPortal.Codelabs

  def new(conn, _param) do
    changeset = Codelab.changeset(%Codelab{})
    render(conn, "new.html", changeset: changeset)
  end

  def index(conn, _params) do
    codelabs = Codelabs.list_of_codelabs_with_category_preloaded()
    render(conn, "index.html", codelabs: codelabs)
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

  def edit(conn, %{"id" => id}) do
    codelab = Codelabs.get_codelab(id)
    changeset = Codelabs.change_codelab(codelab)

    render(conn, "edit.html", codelab: codelab, changeset: changeset)
  end

  def update(conn, %{"codelab" => codelab_params, "id" => id}) do
    codelab = Codelabs.get_codelab(id)

    case Codelabs.update_codelab(codelab, codelab_params) do
      {:ok, codelab} ->
        conn
        |> put_flash(:info, "#{codelab.name} has been updated successfully")
        |> redirect(to: Routes.challenge_path(conn, :index))

      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end
end
