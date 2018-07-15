defmodule Duvvy.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :title, :string, null: false
      add :budget_id, references(:budgets, on_delete: :nothing)

      timestamps()
    end

    unique_index(:categories, :title)
    create index(:categories, [:budget_id])
  end
end
