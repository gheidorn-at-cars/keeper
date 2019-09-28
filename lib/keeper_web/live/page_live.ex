defmodule KeeperWeb.PageLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <canvas data-i="<%= @i %>" phx-hook="Canvas">
      Canvas is not supported!
    </canvas>
    """
  end

  def mount(_session, socket) do
    Process.send_after(self(), :update, 16)
    {:ok, assign(socket, :i, 0)}
  end

  def handle_info(:update, %{assigns: %{i: i}} = socket) do
    Process.send_after(self(), :update, 16)
    {:noreply, assign(socket, :i, i + 0.05)}
  end
end
