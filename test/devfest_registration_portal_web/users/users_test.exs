defmodule DevfestRegistrationPortalWeb.UsersTest do
  use DevfestRegistrationPortalWeb.ConnCase

  @moduledoc """
  this is the users test
  """
  alias DevfestRegistrationPortal.Accounts
  alias DevfestRegistrationPortal.Accounts.User
  alias DevfestRegistrationPortal.Repo

  setup do
    valid_params = %{
      first_name: "Kaunda",
      last_name: "Caitlin",
      email: "kaunda@gmail.com",
      password: "kaunda",
      experience_level: "intermediate",
      institution: "colledge"
    }

    invalid_params = %{
      first_name: "Kaunda",
      last_name: "Caitlin",
      email: "",
      password: "kaunda",
      experience_level: "intermediate",
      institution: "colledge"
    }

    [valid_params: valid_params, invalid_params: invalid_params]
  end

  test "user with valid params is created in the database", %{
    valid_params: valid_params
  } do
    Accounts.register_user(valid_params)
    user = Repo.get_by(User, first_name: "Kaunda")
    assert user.first_name == "Kaunda"
    refute user.first_name == nil
  end
end
