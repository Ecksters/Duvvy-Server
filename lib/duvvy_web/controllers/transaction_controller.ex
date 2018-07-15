defmodule DuvvyWeb.TransactionController do
  use DuvvyWeb, :controller

  alias Duvvy.Finance
  alias Duvvy.Finance.Transaction

  action_fallback DuvvyWeb.FallbackController

  def index(conn, _params) do
    transactions = Finance.list_transactions()
    render(conn, "index.json", transactions: transactions)
  end

  def create(conn, %{"transaction" => transaction_params}) do
    with {:ok, %Transaction{} = transaction} <- Finance.create_transaction(transaction_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", transaction_path(conn, :show, transaction))
      |> render("show.json", transaction: transaction)
    end
  end

  def create(conn, %{"transactions" => transactions}) do
    {_count, results} = Finance.create_transactions(transactions)
    conn
      |> put_status(:created)
      |> put_resp_header("location", transaction_path(conn, :index, results))
      |> render("index.json", %{transactions: results})
  end

  def show(conn, %{"id" => id}) do
    transaction = Finance.get_transaction!(id)
    render(conn, "show.json", transaction: transaction)
  end

  def update(conn, %{"id" => id, "transaction" => transaction_params}) do
    transaction = Finance.get_transaction!(id)

    with {:ok, %Transaction{} = transaction} <- Finance.update_transaction(transaction, transaction_params) do
      render(conn, "show.json", transaction: transaction)
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction = Finance.get_transaction!(id)
    with {:ok, %Transaction{}} <- Finance.delete_transaction(transaction) do
      send_resp(conn, :no_content, "")
    end
  end
end
