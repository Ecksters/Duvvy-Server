defmodule Duvvy.Finance.Category do
  use Ecto.Schema
  import Ecto.Changeset


  schema "categories" do
    field :title, :string
    field :budget_id, :id, read_after_writes: true

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> unique_constraint(:title)
    |> validate_length(:title, max: 40)
  end
end
