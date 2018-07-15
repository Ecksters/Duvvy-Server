defmodule Duvvy.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :description, :string
      add :amount, :decimal
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:transactions, [:category_id])
  end
end
