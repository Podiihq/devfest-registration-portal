defmodule DevfestRegistrationPortalWeb.IntegrationCase do
  @moduledoc """
  integration case module
  """
  use ExUnit.CaseTemplate

  using do
    quote do
      use DevfestRegistrationPortalWeb.ConnCase
      use PhoenixIntegration
    end
  end
end
