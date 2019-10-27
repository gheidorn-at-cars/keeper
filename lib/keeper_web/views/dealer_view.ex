defmodule KeeperWeb.DealerView do
  use KeeperWeb, :view
  alias KeeperWeb.DealerView

  def render("index.json", %{dealers: dealers}) do
    %{data: render_many(dealers, DealerView, "dealer.json")}
  end

  def render("show.json", %{dealer: dealer}) do
    %{data: render_one(dealer, DealerView, "dealer.json")}
  end

  def render("dealer.json", %{dealer: dealer}) do
    %{id: dealer.id,
      name: dealer.name,
      primary_contact: dealer.primary_contact,
      make: dealer.make}
  end
end
