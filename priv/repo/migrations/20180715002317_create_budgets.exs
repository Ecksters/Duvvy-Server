defmodule Duvvy.Repo.Migrations.CreateBudgets do
  use Ecto.Migration

  def change do
    create table(:budgets) do
      add :title, :string

      timestamps()
    end

  end
end
