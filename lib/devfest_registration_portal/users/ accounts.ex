defmodule DevfestRegistrationPortal.Accounts do
  @moduledoc """
  this is the accounts context
  """
  alias DevfestRegistrationPortal.Accounts.User
  alias DevfestRegistrationPortal.Repo

  def register_user(params \\ %{}) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end
end
