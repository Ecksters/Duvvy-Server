defmodule DuvvyWeb.BudgetController do
  use DuvvyWeb, :controller

  alias Duvvy.Finance
  alias Duvvy.Finance.Budget

  action_fallback DuvvyWeb.FallbackController

  def index(conn, _params) do
    budgets = Finance.list_budgets()
    render(conn, "index.json", budgets: budgets)
  end

  def create(conn, %{"budget" => budget_params}) do
    with {:ok, %Budget{} = budget} <- Finance.create_budget(budget_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", budget_path(conn, :show, budget))
      |> render("show.json", budget: budget)
    end
  end

  def create(conn, %{"budgets" => budgets}) do
    {_count, results} = Finance.create_budgets(budgets)
    conn
      |> put_status(:created)
      |> put_resp_header("location", budget_path(conn, :index, results))
      |> render("index.json", %{budgets: results})
  end

  def show(conn, %{"id" => id}) do
    budget = Finance.get_budget!(id)
    render(conn, "show.json", budget: budget)
  end

  def update(conn, %{"id" => id, "budget" => budget_params}) do
    budget = Finance.get_budget!(id)

    with {:ok, %Budget{} = budget} <- Finance.update_budget(budget, budget_params) do
      render(conn, "show.json", budget: budget)
    end
  end

  def delete(conn, %{"id" => id}) do
    budget = Finance.get_budget!(id)
    with {:ok, %Budget{}} <- Finance.delete_budget(budget) do
      send_resp(conn, :no_content, "")
    end
  end
end
