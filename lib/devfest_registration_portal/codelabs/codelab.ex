defmodule DevfestRegistrationPortal.Codelab do
  @moduledoc """

  This is codelab schema

  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "codelabs" do
    field :category_id, :integer
    field :description, :string
    field :url, :string
    field :level, :string
    field :name, :string

    timestamps()
  end

  def changeset(codelab, attr) do
    codelab
    |> cast(attr, [
      :category_id,
      :description,
      :url,
      :level,
      :name
    ])
    |> validate_required([:category_id, :url, :level, :name])
    |> validate_length(:description, max: 100)
  end
end
