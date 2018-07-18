defmodule Duvvy.Finance.Budget do
  use Ecto.Schema
  import Ecto.Changeset


  schema "budgets" do
    field :title, :string
    field :goal, :decimal

    timestamps()
  end

  @doc false
  def changeset(budget, attrs) do
    budget
    |> cast(attrs, [:title, :goal])
    |> validate_required([:title])
    |> unique_constraint(:title)
    |> validate_length(:title, max: 40)
  end
end
