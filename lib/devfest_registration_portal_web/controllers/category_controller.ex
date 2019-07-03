defmodule DevfestRegistrationPortalWeb.CategoryController do
  use DevfestRegistrationPortalWeb, :controller

  alias DevfestRegistrationPortal.Codelabs
  alias DevfestRegistrationPortal.Codelabs.Category

  def new(conn, _params) do
    changeset = Category.changeset(%Category{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"category" => category_params}) do
    case Codelabs.create_category(category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "#{category.name} category added successfully!!")
        |> redirect(to: Routes.category_path(conn, :new))

      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end
