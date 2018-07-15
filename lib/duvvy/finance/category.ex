defmodule Duvvy.Finance.Category do
  use Ecto.Schema
  import Ecto.Changeset


  schema "categories" do
    field :amount, :decimal
    field :title, :string
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:title, :amount])
    |> validate_required([:title, :amount])
    |> unique_constraint(:title)
    |> validate_length(:title, max: 40)
  end
end
