defmodule KeeperWeb.DealerController do
  use KeeperWeb, :controller

  alias Keeper.Customers
  alias Keeper.Customers.Dealer

  action_fallback KeeperWeb.FallbackController

  def index(conn, _params) do
    dealers = Customers.list_dealers()
    render(conn, "index.json", dealers: dealers)
  end

  def create(conn, %{"dealer" => dealer_params}) do
    with {:ok, %Dealer{} = dealer} <- Customers.create_dealer(dealer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.dealer_path(conn, :show, dealer))
      |> render("show.json", dealer: dealer)
    end
  end

  def show(conn, %{"id" => id}) do
    dealer = Customers.get_dealer!(id)
    render(conn, "show.json", dealer: dealer)
  end

  def update(conn, %{"id" => id, "dealer" => dealer_params}) do
    dealer = Customers.get_dealer!(id)

    with {:ok, %Dealer{} = dealer} <- Customers.update_dealer(dealer, dealer_params) do
      render(conn, "show.json", dealer: dealer)
    end
  end

  def delete(conn, %{"id" => id}) do
    dealer = Customers.get_dealer!(id)

    with {:ok, %Dealer{}} <- Customers.delete_dealer(dealer) do
      send_resp(conn, :no_content, "")
    end
  end
end
