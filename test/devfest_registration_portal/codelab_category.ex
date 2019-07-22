defmodule DevfestRegistrationPortal.CategoryTest do
  @moduledoc false
  import DevfestRegistrationPortal.Factory

  alias DevfestRegistrationPortal.Codelabs
  alias DevfestRegistrationPortal.Codelabs.Category
  alias DevfestRegistrationPortal.Repo

  test "create_codelab_category/1 inserts the specified codelab category" do
    category = %{"name" => "DevOps"}
    Codelabs.create_category(category)

    assert Repo.get_by(Category, name: "DevOps") == category
  end
end
