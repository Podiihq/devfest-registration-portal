defmodule DevfestRegistrationPortalWeb.AttendeeController do
  use DevfestRegistrationPortalWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
