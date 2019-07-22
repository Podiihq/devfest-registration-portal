defmodule DevfestRegistrationPortalWeb.PageControllerTest do
  use DevfestRegistrationPortalWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /challenge", %{conn: conn} do
    conn = get(conn, "/challenge")
    assert html_response(conn, 200) =~ "Choose a Codelab to take"
    assert html_response(conn, 200) =~ "Start"
  end
end
