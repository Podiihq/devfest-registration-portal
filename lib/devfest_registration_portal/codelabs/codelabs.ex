defmodule DevfestRegistrationPortal.Codelabs do
  @moduledoc """
      Context for codelabs
  """
  alias DevfestRegistrationPortal.Codelab
  alias DevfestRegistrationPortal.Codelabs.Category
  alias DevfestRegistrationPortal.Repo

  @doc """
  Saves a category into the database
  """
  @spec create_category(map()) :: {:ok, %Category{}} | {:error, %Ecto.Changeset{}}
  def create_category(attrs) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns a list of categories present in the database
  """
  @spec list_all_categories() :: [%Category{}, ...]
  def list_all_categories do
    Category
    |> Repo.all()
  end

  def create_codelab(attrs \\ %{}) do
    %Codelab{}
    |> Codelab.changeset(attrs)
    |> Repo.insert()
  end
end
