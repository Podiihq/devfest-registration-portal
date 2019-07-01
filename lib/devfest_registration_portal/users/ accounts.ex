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
  def get_user_by_id(user_id) do
    User
    |>
    Repo.get(user_id)
  end

  def check_user_email_and_pass(email, password) do
    user = get_user_by_email(email)

    cond do
      user && Comeonin.Pbkdf2.checkpw(password) ->
        {:ok, user}

      user ->
        {:error, :unauthorized}

      true ->
        Pbkdf2.no_user_verify()
        {:error, :not_found}
    end
  end

  def get_user_by_email(email) do
    User
    |> Repo.get_by(email: email)
  end
end
