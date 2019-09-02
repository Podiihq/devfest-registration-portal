defmodule DevfestRegistrationPortal.CodelabChallengeTest do
  @moduledoc """
    Handles tests for codelab categories
  """
  use DevfestRegistrationPortal.DataCase
  alias DevfestRegistrationPortal.Codelab
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
    {:ok, codelab} = Codelabs.create_codelab(valid_attr)
    assert codelab.name == "challenge1"
    assert codelab.level == "level1"
  end

  test "description should be of maximum length of 100", %{valid_attr: valid_attr} do
    description = String.duplicate("a", 101)
    attr = %{valid_attr | "description" => description}
    changeset = Codelab.changeset(%Codelab{}, attr)

    assert %{description: ["should be at most 100 character(s)"]} = errors_on(changeset)
    assert {:error, _changeset} = Codelabs.create_codelab(attr)
  end
end
