defmodule DevfestRegistrationPortalWeb.Router do
  use DevfestRegistrationPortalWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug DevfestRegistrationPortalWeb.Auth
  end

  pipeline :authorize do
    plug DevfestRegistrationPortalWeb.Authorize
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DevfestRegistrationPortalWeb do
    pipe_through [:browser, :authorize]
    get "/", PageController, :index
    resources "/categories", CategoryController, only: [:new, :create, :index, :edit, :update]
    resources "/challenge", ChallengeController
  end

  scope "/", DevfestRegistrationPortalWeb do
    pipe_through :browser
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/users", UserController, only: [:new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", DevfestRegistrationPortalWeb do
  # pipe_through :api
  # end
end
