defmodule DevfestRegistrationPortal.Repo.Migrations.CreateCodlabCategories do
  use Ecto.Migration

  def change do
    create table(:codelab_categories) do
      add :name, :string, null: false

      timestamps()
    end
  end
end
