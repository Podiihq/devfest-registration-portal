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

  def change_category do
    %Category{}
    |> Category.changeset()
  end

  def change_category(category) do
    category
    |> Category.changeset()
  end

  def change_codelab(%Codelab{} = codelab) do
    codelab
    |> Codelab.changeset()
  end

  @doc """
  Returns the category from the the database with the given id
  """
  @spec get_category(integer()) :: %Category{} | nil
  def get_category(id) do
    Category
    |> Repo.get(id)
  end

  @doc """
  Returns the codelab challenge from the database with the given id
  """
  @spec get_codelab(integer()) :: %Codelab{} | nil
  def get_codelab(id) do
    Codelab
    |> Repo.get(id)
  end

  @doc """
  Updates a given category with the given attributes
  """
  @spec update_category(%Category{}, map()) :: {:ok, %Category{}} | {:error, %Ecto.Changeset{}}
  def update_category(category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  def update_codelab(codelab, attrs) do
    codelab
    |> Codelab.changeset(attrs)
    |> Repo.update()
  end
end
