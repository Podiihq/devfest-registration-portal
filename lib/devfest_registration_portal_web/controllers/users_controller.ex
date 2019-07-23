defmodule DevfestRegistrationPortalWeb.UserController do
  use DevfestRegistrationPortalWeb, :controller

  alias DevfestRegistrationPortal.Accounts
  alias DevfestRegistrationPortal.Accounts.User
  alias DevfestRegistrationPortalWeb.Auth

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        conn
        |> Auth.login(user)
        |> put_flash(:info, "Welcome #{user.first_name}")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Something went wrong!! Checkout the highlighted fields")
        |> render("new.html", changeset: changeset)
    end
  end
end
