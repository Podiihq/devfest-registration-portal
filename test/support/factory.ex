defmodule DevfestRegistrationPortal.Factory do
  @moduledoc """
  Generates builds and inserts data for use in tests
  """
  alias DevfestRegistrationPortal.Codelabs.Category
  alias DevfestRegistrationPortal.Repo

  def build(:codelab_category) do
    %Category{
      name: "android"
    }
  end

  def build(factory_name, attributes) do
    factory_name
    |> build()
    |> struct(attributes)
  end

  def insert!(factory_name, attrs \\ []) do
    factory_name
    |> build(attrs)
    |> Repo.insert!()
  end
end
