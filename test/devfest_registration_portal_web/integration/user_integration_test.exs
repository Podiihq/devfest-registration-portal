defmodule DevfestRegistrationPortalTest.UserIntegrationTest do
  use DevfestRegistrationPortalWeb.ConnCase

  test "user cannot  session can view codelab index page when not logged in", %{conn: conn} do
    conn = get(conn, Routes.challenge_path(conn, :index))

    assert html_response(conn, 302)
    assert conn.halted
  end
end
