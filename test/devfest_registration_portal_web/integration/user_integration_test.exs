defmodule DevfestRegistrationPortalTest.UserIntegrationTest do
  use DevfestRegistrationPortalWeb.IntegrationCase

  alias DevfestRegistrationPortal.Accounts

  setup do
    valid_params = %{
      email: "xily@mailinator.net",
      experience_level: "Omnis ut irure vitae",
      first_name: "Maite",
      institution: "Tempora voluptas und",
      last_name: "Weiss",
      password: "Pa$$w0rd!"
    }

    Accounts.register_user(valid_params)

    login_params = %{email: "xily@mailinator.net", password: "Pa$$w0rd!"}

    [valid_params: valid_params, login_params: login_params]
  end

  test "user can register", %{conn: conn, valid_params: valid_params} do
    conn
    |> get(Routes.user_path(conn, :new))
    |> follow_form(user: valid_params)
    |> assert_response(html: "Welcome #{valid_params.first_name}")
  end

  test "user can login with right credentials", %{conn: conn, login_params: login_params} do
    conn
    |> get(Routes.session_path(conn, :new))
    |> follow_form(session: login_params)
    |> assert_response(html: "Welcome back")
  end

  test "user cannot  session can view codelab index page when not logged in", %{conn: conn} do
    conn
    |> get(Routes.challenge_path(conn, :index))
    |> assert_response(status: 302)
    |> follow_redirect()
    |> assert_response(html: "You must be logged in to access that page")
  end
end
