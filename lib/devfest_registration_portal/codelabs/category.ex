defmodule DevfestRegistrationPortal.Codelabs.Category do
  @moduledoc """
  schema for codelab categories table
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string, null: false

    timestamps()
  end

  def changeset(category, attrs \\ %{}) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
