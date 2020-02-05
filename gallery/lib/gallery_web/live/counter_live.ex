defmodule GalleryWeb.CounterLive do
  use Phoenix.LiveView
  require Logger

  def mount(_session, socket) do
    {:ok, assign(socket, :counter, 0)}
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~L"""
    <label>Counter: <%= @counter %></label>
    <button phx-click="incr">+</button>
    <button phx-click="decr">-</button>
    """
  end

  def handle_event("incr", _event, socket) do
    socket = update(socket, :counter, &(&1 + 1))
    {:noreply, socket}
  end

  def handle_event("decr", _event, socket) do
    socket = update(socket, :counter, &(&1 - 1))
    {:noreply, socket}
  end
end
