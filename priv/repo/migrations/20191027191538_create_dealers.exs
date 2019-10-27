defmodule Keeper.Repo.Migrations.CreateDealers do
  use Ecto.Migration

  def change do
    create table(:dealers) do
      add :name, :string
      add :primary_contact, :string
      add :make, :string

      timestamps()
    end

  end
end
