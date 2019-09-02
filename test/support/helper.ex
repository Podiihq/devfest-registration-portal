ExUnit.start()

defmodule DevfestRegistrationPortalTest.Helper do
  @moduledoc """
  Module for writing common functions shared among many test
  """

  use DevfestRegistrationPortalWeb.ConnCase
  alias DevfestRegistrationPortal.Accounts

  @params %{
    email: "xily@mailinator.net",
    experience_level: "Omnis ut irure vitae",
    first_name: "Maite",
    institution: "Tempora voluptas und",
    last_name: "Weiss",
    password: "Pa$$w0rd!"
  }

  def login(conn) do
    {:ok, _} = Accounts.register_user(@params)

    conn
    |> get(Routes.session_path(conn, :new))
    |> follow_form(session: %{email: "xily@mailinator.net", password: "Pa$$w0rd!"})
  end
end
