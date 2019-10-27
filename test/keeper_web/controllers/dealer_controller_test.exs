defmodule KeeperWeb.DealerControllerTest do
  use KeeperWeb.ConnCase

  alias Keeper.Customers
  alias Keeper.Customers.Dealer

  @create_attrs %{
    make: "some make",
    name: "some name",
    primary_contact: "some primary_contact"
  }
  @update_attrs %{
    make: "some updated make",
    name: "some updated name",
    primary_contact: "some updated primary_contact"
  }
  @invalid_attrs %{make: nil, name: nil, primary_contact: nil}

  def fixture(:dealer) do
    {:ok, dealer} = Customers.create_dealer(@create_attrs)
    dealer
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all dealers", %{conn: conn} do
      conn = get(conn, Routes.dealer_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create dealer" do
    test "renders dealer when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dealer_path(conn, :create), dealer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.dealer_path(conn, :show, id))

      assert %{
               "id" => id,
               "make" => "some make",
               "name" => "some name",
               "primary_contact" => "some primary_contact"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dealer_path(conn, :create), dealer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update dealer" do
    setup [:create_dealer]

    test "renders dealer when data is valid", %{conn: conn, dealer: %Dealer{id: id} = dealer} do
      conn = put(conn, Routes.dealer_path(conn, :update, dealer), dealer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.dealer_path(conn, :show, id))

      assert %{
               "id" => id,
               "make" => "some updated make",
               "name" => "some updated name",
               "primary_contact" => "some updated primary_contact"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, dealer: dealer} do
      conn = put(conn, Routes.dealer_path(conn, :update, dealer), dealer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete dealer" do
    setup [:create_dealer]

    test "deletes chosen dealer", %{conn: conn, dealer: dealer} do
      conn = delete(conn, Routes.dealer_path(conn, :delete, dealer))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.dealer_path(conn, :show, dealer))
      end
    end
  end

  defp create_dealer(_) do
    dealer = fixture(:dealer)
    {:ok, dealer: dealer}
  end
end
