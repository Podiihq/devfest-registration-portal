defmodule DevfestRegistrationPortalTest.CategoryIntegrationTest do
  use DevfestRegistrationPortalWeb.ConnCase
  import DevfestRegistrationPortal.Factory

  test "admin can create codelab categories", %{conn: conn} do
    conn
    |> get(Routes.category_path(conn, :new))
    |> follow_form(%{category: %{name: "android"}}, %{method: "post"})
    |> assert_response(html: "android category added successfully!")
  end

  test "admin can list codelab categories", %{conn: conn} do
    category = insert!(:category)

    conn
    |> get(Routes.category_path(conn, :index))
    |> assert_response(html: "#{category.name}")
  end

  test "codelab category can be deleted", %{conn: conn} do
    category = insert!(:category)

    conn
    |> get(Routes.category_path(conn, :index))
    |> follow_link("#delete-category-#{category.id}", %{method: "delete"})
    |> assert_response(html: "#{category.name} deleted successfully!!")
    |> follow_redirect(to: Routes.category_path(conn, :index))
    |> refute_response(html: "#{category.name}")
  end
end
