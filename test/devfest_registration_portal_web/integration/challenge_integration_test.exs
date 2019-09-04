defmodule DevfestRegistrationPortalTest.ChallengeIntegrationTest do
  use DevfestRegistrationPortalWeb.ConnCase
  import DevfestRegistrationPortalTest.Helper

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
