defmodule DevfestRegistrationPortal.CategoryTest do
  import DevfestRegistrationPortal.Factory

  alias DevfestRegistrationPortal.Codelabs
  alias DevfestRegistrationPortal.Codelabs.Category
  alias DevfestRegistrationPortal.Repo

  test "create_codelab_category/1 inserts the specified codelab category" do
    category = %{"name" => "DevOps"}
    Codelabs.create_category(category)

    assert Repo.get_by(Category, name: "DevOps") == category
  end

  test "list_all_categories/0 gets all regisitered codelabs" do
    1..30
    |> Enum.each(fn num -> insert_to_new_db(:category, name: "category#{num}") end)

    assert Codelabs.list_all_categories() |> Enum.count() == 30
  end
end
