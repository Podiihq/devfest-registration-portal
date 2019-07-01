defmodule DevfestRegistrationPortalTest.CategoryIntegrationTest do
  use DevfestRegistrationPortalWeb.ConnCase

  test "admin can create codelab categories", %{conn: conn} do
    conn
    |> get(Routes.category_path(conn, :new))
    |> follow_form(%{category: %{name: "android"}}, %{method: "post"})
    |> assert_response(html: "android category added successfully!")
  end
end
