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

  test "admin can create codelab challenge", %{conn: conn} do
    conn
    |> login()
    |> get(Routes.challenge_path(conn, :new))
    |> follow_form(%{
      codelab: %{
        name: "challenge1",
        url: "https://regex101.com",
        level: "level1",
        description: "description1"
      }
    })
    |> assert_response(html: "challenge1 created!")
  end

  test "admin can list codelab challenge", %{conn: conn} do
    conn
    |> login()
    |> get(Routes.challenge_path(conn, :index))
    |> assert_response(html: "List Of Codelabs")
  end
end
