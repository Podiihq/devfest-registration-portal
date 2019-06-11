defmodule DevfestRegistrationPortalWeb.AttendeeController do
  use DevfestRegistrationPortalWeb, :controller

  alias DevfestRegistrationPortal.Accounts
  alias DevfestRegistrationPortal.Accounts.Attendee

  def new(conn, _params) do
    changeset = Attendee.changeset(%Attendee{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"attendee" => attendee_params}) do
    case Accounts.register_attendee(attendee_params) do
      {:ok, _attendee} ->
        conn
        |> put_flash(:info, "Welcome #{attendee_params["first_name"]}")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Something went wrong!! Checkout the highlighted fields")
        |> render("new.html", changeset: changeset)
    end
  end
end
