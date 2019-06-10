defmodule DevfestRegistrationPortal.Account do
  alias DevfestRegistrationApp.Accounts.Attendee

  def register_attendee(params \\ %{}) do
    %Attendee{}
    |> Attendee.changeset(params)
    |> Repo.insert()
  end
end
