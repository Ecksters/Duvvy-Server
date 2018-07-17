defmodule Duvvy.Finance.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :amount, :decimal
    field :date, :date
    field :description, :string
    field :category_id, :id, read_after_writes: true

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:date, :description, :amount, :category_id])
    |> validate_required([:date, :description, :amount])
  end
end
