defmodule DevfestRegistrationPortal.Codelab do
  @moduledoc """

  This is codelab schema

  """
  use Ecto.Schema
  import Ecto.Changeset
  alias DevfestRegistrationPortal.Codelabs.Category

  schema "codelabs" do
    field :description, :string
    field :url, :string
    field :level, :string
    field :name, :string
    belongs_to :category, Category

    timestamps()
  end

  def changeset(codelab, attr \\ %{}) do
    codelab
    |> cast(attr, [
      :description,
      :url,
      :level,
      :name,
      :category_id
    ])
    |> validate_required([:name])
    |> validate_length(:description, max: 100)
  end
end
