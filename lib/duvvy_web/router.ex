defmodule DuvvyWeb.Router do
  use DuvvyWeb, :router

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

  scope "/api/v1", DuvvyWeb do
    pipe_through :api

    resources "/budgets", BudgetController
    resources "/categories", CategoryController
    resources "/transactions", TransactionController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DuvvyWeb do
  #   pipe_through :api
  # end
end
