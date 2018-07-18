defmodule Duvvy.Repo.Migrations.CreateBudgets do
  use Ecto.Migration

  def change do
    create table(:budgets) do
      add :title, :string, null: false
      add :goal, :decimal

      timestamps()
    end

    alter table(:budgets) do
      modify :inserted_at, :utc_datetime, default: fragment("NOW()")
      modify :updated_at, :utc_datetime, default: fragment("NOW()")
    end

    create unique_index(:budgets, :title)
  end
end
