defmodule Duvvy.Repo.Migrations.CreateBudgets do
  use Ecto.Migration

  def change do
    create table(:budgets) do
      add :title, :string, null: false

      timestamps()
    end

    unique_index(:budgets, :title)
  end
end
