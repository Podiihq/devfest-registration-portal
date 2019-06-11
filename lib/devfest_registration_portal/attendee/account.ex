defmodule DevfestRegistrationPortal.Accounts do
  @moduledoc """
  this is the accounts context
  """
  alias DevfestRegistrationPortal.Accounts.Attendee
  alias DevfestRegistrationPortal.Repo

  def register_attendee(params \\ %{}) do
    %Attendee{}
    |> Attendee.changeset(params)
    |> Repo.insert()
  end
end
