defmodule DevfestRegistrationPortal.Accounts.User do
  @moduledoc """
  this is the attendee's schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :experience_level, :string
    field :institution, :string

    timestamps()
  end

  def changeset(users, params \\ %{}) do
    users
    |> cast(params, [:first_name, :last_name, :email, :password, :experience_level, :institution])
    |> validate_required([
      :first_name,
      :last_name,
      :email,
      :password,
      :experience_level,
      :institution
    ])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 6, max: 16)
    |> _add_hashed_password()
  end

  defp _add_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, _hash_password(pass))

      _ ->
        changeset
    end
  end

  defp _hash_password(password) do
    hash = Bcrypt.add_hash(password)
    hash.password_hash
  end
end
