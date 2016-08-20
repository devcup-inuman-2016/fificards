defmodule Fificards.Router do
  use Fificards.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    plug Fificards.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Fificards do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/auth", Fificards.Auth  do
    pipe_through :browser

    get "/:provider", UserController, :request
    get "/:provider/callback", UserController, :callback
    delete "/logout", UserController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", Fificards do
  #   pipe_through :api
  # end
end
