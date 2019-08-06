defmodule DevfestRegistrationPortalWeb.CategoryController do
  use DevfestRegistrationPortalWeb, :controller

  alias DevfestRegistrationPortal.Codelabs

  def new(conn, _params) do
    changeset = Codelabs.change_category()
    render(conn, "new.html", changeset: changeset)
  end

  def index(conn, _params) do
    categories = Codelabs.list_all_categories()
    render(conn, "index.html", categories: categories)
  end

  def create(conn, %{"category" => category_params}) do
    case Codelabs.create_category(category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "#{category.name} category added successfully!!")
        |> redirect(to: Routes.category_path(conn, :index))

      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Codelabs.get_category(id)

    case Codelabs.delete_category(category) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "#{category.name} deleted successfully!!")
        |> redirect(to: Routes.category_path(conn, :index))

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Sorry, an error occured")
        |> redirect(to: Routes.category_path(conn, :index))
    end
  end

  def edit(conn, %{"id" => id}) do
    category = Codelabs.get_category(id)
    changeset = Codelabs.change_category(category)

    conn
    |> render("edit.html", category: category, changeset: changeset)
  end

  def update(conn, %{"category" => category_params, "id" => id}) do
    category = Codelabs.get_category(id)

    case Codelabs.update_category(category, category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "#{category.name} category updated successfully!!")
        |> redirect(to: Routes.category_path(conn, :index))

      {:error, changeset} ->
        conn
        |> render("edit.html", changeset: changeset, category: category)
    end
  end
end
