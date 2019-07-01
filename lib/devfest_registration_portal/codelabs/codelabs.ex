defmodule DevfestRegistrationPortal.Codelabs do
  @moduledoc """
      Context for codelabs
  """
  alias DevfestRegistrationPortal.Codelabs.Category
  alias DevfestRegistrationPortal.Repo

  def create_category(attrs) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end
end
