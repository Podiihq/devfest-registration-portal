defmodule :"Elixir.DevfestRegistrationPortal.Repo.Migrations.CreateAttendees-table" do
  use Ecto.Migration

  def change do
    create table(:attendees) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :experience_level, :string
      add :institution, :string

      timestamps()
    end
  end
end
