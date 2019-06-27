defmodule DevfestRegistrationPortal.Codelab.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :category_id, :integer
    field :description, :string
    field :url, :string
    field :level, :string

    timestamps()
  end
end
