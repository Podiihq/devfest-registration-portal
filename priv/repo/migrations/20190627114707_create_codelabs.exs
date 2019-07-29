defmodule DevfestRegistrationPortal.Repo.Migrations.CreateCodelabs do
  use Ecto.Migration

  def change do
    create table(:codelabs) do
      add :description, :string
      add :url, :string
      add :level, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:codelabs, [:name])
  end
end
