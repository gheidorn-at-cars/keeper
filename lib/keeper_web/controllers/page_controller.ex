defmodule KeeperWeb.PageController do
  use KeeperWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    # render(conn, "index.html")
    LiveView.Controller.live_render(conn, KeeperWeb.PageLive, session: %{})
  end
end
