defmodule DevfestRegistrationPortalWeb.ChallengeView do
  use DevfestRegistrationPortalWeb, :view
  alias DevfestRegistrationPortal.Codelabs

  def category_name do
    categories = Codelabs.list_all_categories()

    Enum.map(categories, fn category ->
      {category.name, category.id}
    end)
  end

  def category_name(nil), do: ""
  def category_name(category), do: category.name
end
