defmodule DevfestRegistrationPortalTest.ChallengeIntegrationTest do
  use DevfestRegistrationPortalWeb.ConnCase
  import DevfestRegistrationPortal.Factory
  import DevfestRegistrationPortalTest.Helper

  test "admin can edit codelab challenge", %{conn: conn} do
    codelab = insert!(:codelab)

    conn
    |> login()
    |> get(Routes.challenge_path(conn, :edit, codelab))
    |> follow_form(%{
      codelab: %{
        name: "challenge2",
        level: "level1",
        description: "description1",
        url: "https://regex101.com"
      }
    })
    |> assert_response(html: "challenge2 has been updated successfully")
  end
end
