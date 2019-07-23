defmodule DevfestRegistrationPortal.Accounts do
  @moduledoc """
  this is the accounts context
  """

  alias DevfestRegistrationPortal.Accounts.User
  alias DevfestRegistrationPortal.Repo

  def register_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_user(id) do
    User
    |> Repo.get(id)
  end

  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
  end

  def authenticate_by_email_and_pass(email, given_pass) do
    user = get_user_by_email(email)

    cond do
      user && Bcrypt.verify_pass(given_pass, user.password_hash) ->
        {:ok, user}

      user ->
        {:error, :unauthorized}

      true ->
        Bcrypt.no_user_verify()
        {:error, :not_found}
    end
  end
end
