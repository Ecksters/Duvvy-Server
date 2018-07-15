defmodule Duvvy.Finance.Transaction do
  use Ecto.Schema
  import Ecto.Changeset


  schema "transactions" do
    field :amount, :decimal
    field :description, :string
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:description, :amount])
    |> validate_required([:description, :amount])
  end
end
