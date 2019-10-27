defmodule Keeper.Customers.Dealer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dealers" do
    field :make, :string
    field :name, :string
    field :primary_contact, :string

    timestamps()
  end

  @doc false
  def changeset(dealer, attrs) do
    dealer
    |> cast(attrs, [:name, :primary_contact, :make])
    |> validate_required([:name, :primary_contact, :make])
  end
end
