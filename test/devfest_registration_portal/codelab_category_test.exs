defmodule DevfestRegistrationPortal.CategoryTest do
  @moduledoc """
    Handles tests for codelab categories
  """
  use DevfestRegistrationPortalWeb.ConnCase
  import DevfestRegistrationPortal.Factory
  alias DevfestRegistrationPortal.Codelabs
  alias DevfestRegistrationPortal.Codelabs.Category
  alias DevfestRegistrationPortal.Repo

  setup do
    [
      category_attrs: %{"name" => "DevOps"}
    ]
  end

  test "create_codelab_category/1 inserts the specified codelab category", %{
    category_attrs: attrs
  } do
    {:ok, category} = Codelabs.create_category(attrs)

    assert Repo.get_by(Category, name: "DevOps") == category
  end

  test "list_all_categories/0 gets all regisitered codelabs" do
    1..30
    |> Enum.each(fn num -> insert!(:category, name: "category#{num}") end)

    assert Codelabs.list_all_categories() |> Enum.count() == 30
  end

  test "delete_category/1 deletes the given category from the database" do
    category = insert!(:category)

    assert {:ok, deleted_category} = Codelabs.delete_category(category)
    assert deleted_category.id == category.id
    assert Repo.get(Category, category.id) == nil
  end

  test "update_category/2 updates the given category with the attributes specified" do
    category = insert!(:category)

    {:ok, updated_category} = Codelabs.update_category(category, %{name: "abc"})

    assert Repo.get(Category, category.id) == updated_category
  end
end
