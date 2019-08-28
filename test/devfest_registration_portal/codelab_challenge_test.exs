defmodule DevfestRegistrationPortal.CodelabChallengeTest do
  @moduledoc """
    Handles tests for codelab categories
  """
  use DevfestRegistrationPortalWeb.ConnCase
  alias DevfestRegistrationPortal.Codelabs

  setup do
    valid_attr = %{
      "url" => "https://regex101.com",
      "level" => "level1",
      "name" => "challenge1",
      "description" => "description1"
    }

    [valid_attr: valid_attr]
  end

  test "create_codelab/1 inserts codelab challenge to database", %{valid_attr: valid_attr} do
    assert {:ok, _codelab} = Codelabs.create_codelab(valid_attr)
  end
end
