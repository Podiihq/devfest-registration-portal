defmodule DevfestRegistrationPortal.CodelabChallengeTest do
  @moduledoc """
    Handles tests for codelab categories
  """
  use DevfestRegistrationPortalWeb.ConnCase
  alias DevfestRegistrationPortal.Codelabs

  test "create_codelab/1 inserts codelab challenge to database" do
    assert {:ok, _codelab} =
             Codelabs.create_codelab(%{
               "url" => "https://regex101.com",
               "level" => "level1",
               "name" => "challenge1"
             })
  end
end
