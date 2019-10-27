defmodule Keeper.CustomersTest do
  use Keeper.DataCase

  alias Keeper.Customers

  describe "dealers" do
    alias Keeper.Customers.Dealer

    @valid_attrs %{make: "some make", name: "some name", primary_contact: "some primary_contact"}
    @update_attrs %{make: "some updated make", name: "some updated name", primary_contact: "some updated primary_contact"}
    @invalid_attrs %{make: nil, name: nil, primary_contact: nil}

    def dealer_fixture(attrs \\ %{}) do
      {:ok, dealer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Customers.create_dealer()

      dealer
    end

    test "list_dealers/0 returns all dealers" do
      dealer = dealer_fixture()
      assert Customers.list_dealers() == [dealer]
    end

    test "get_dealer!/1 returns the dealer with given id" do
      dealer = dealer_fixture()
      assert Customers.get_dealer!(dealer.id) == dealer
    end

    test "create_dealer/1 with valid data creates a dealer" do
      assert {:ok, %Dealer{} = dealer} = Customers.create_dealer(@valid_attrs)
      assert dealer.make == "some make"
      assert dealer.name == "some name"
      assert dealer.primary_contact == "some primary_contact"
    end

    test "create_dealer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_dealer(@invalid_attrs)
    end

    test "update_dealer/2 with valid data updates the dealer" do
      dealer = dealer_fixture()
      assert {:ok, %Dealer{} = dealer} = Customers.update_dealer(dealer, @update_attrs)
      assert dealer.make == "some updated make"
      assert dealer.name == "some updated name"
      assert dealer.primary_contact == "some updated primary_contact"
    end

    test "update_dealer/2 with invalid data returns error changeset" do
      dealer = dealer_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_dealer(dealer, @invalid_attrs)
      assert dealer == Customers.get_dealer!(dealer.id)
    end

    test "delete_dealer/1 deletes the dealer" do
      dealer = dealer_fixture()
      assert {:ok, %Dealer{}} = Customers.delete_dealer(dealer)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_dealer!(dealer.id) end
    end

    test "change_dealer/1 returns a dealer changeset" do
      dealer = dealer_fixture()
      assert %Ecto.Changeset{} = Customers.change_dealer(dealer)
    end
  end
end
