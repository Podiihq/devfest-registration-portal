defmodule DevfestRegistrationPortal.Codelab do
  @moduledoc """

  This is codelab schema

  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "codelabs" do
    field :description, :string
    field :url, :string
    field :level, :string
    field :name, :string

    timestamps()
  end

  def changeset(codelab, attr \\ %{}) do
    codelab
    |> cast(attr, [
      :description,
      :url,
      :level,
      :name
    ])
    |> validate_required([:url, :level, :name])
    |> validate_length(:description, max: 100)
  end
end
