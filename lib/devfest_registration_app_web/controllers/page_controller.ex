defmodule DevfestRegistrationAppWeb.PageController do
  use DevfestRegistrationAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
