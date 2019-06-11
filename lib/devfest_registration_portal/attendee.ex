defmodule DevfestRegistrationApp.Accounts.Attendee do
  @moduledoc """
  this is the attendee's schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "attendees" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :experience_level, :string
    field :institution, :string

    timestamps()
  end

  def changeset(attendees, params \\ %{}) do
    attendees
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
    |> validate_length(:password, min: 1, max: 16)
    |> _hashing_password()
  end

  defp _hashing_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Pbkdf2.hashpwsalt(password))

      _ ->
        changeset
    end
  end
end
