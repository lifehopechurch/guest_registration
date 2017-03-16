defmodule GuestRegistration.Router do
  use GuestRegistration.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GuestRegistration do
    pipe_through :browser # Use the default browser stack

    get "/", WelcomeController, :new
    post "/", WelcomeController, :create
    get "/thanks", WelcomeController, :thanks
    resources "/registrations", RegistrationController
  end

  # Other scopes may use custom stacks.
  # scope "/api", GuestRegistration do
  #   pipe_through :api
  # end
end
