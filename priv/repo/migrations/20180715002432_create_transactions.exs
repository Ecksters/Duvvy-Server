defmodule Duvvy.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :description, :string, null: false
      add :amount, :decimal, null: false
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    alter table(:transactions) do
      modify :inserted_at, :utc_datetime, default: fragment("NOW()")
      modify :updated_at, :utc_datetime, default: fragment("NOW()")
    end

    create index(:transactions, [:category_id])
  end
end
