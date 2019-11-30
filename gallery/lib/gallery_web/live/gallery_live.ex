defmodule GalleryWeb.GalleryLive do
  use Phoenix.LiveView

  @images [
    "https://images.unsplash.com/photo-1562971179-4ad6903a7ed6?w=500&h=500&fit=crop",
    "https://images.unsplash.com/photo-1552673597-e3cd6747a996?w=500&h=500&fit=crop",
    "https://images.unsplash.com/photo-1561133036-61a7ed56b424?w=500&h=500&fit=crop",
    "https://images.unsplash.com/photo-1530717449302-271006cdc1bf?w=500&h=500&fit=crop"
  ]

  @images_count Enum.count(@images)

  def mount(_session, socket) do
    {:ok, assign(socket, :idx, 0)}
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~L"""
    <label>Index: <%= @idx %></label>
    <button phx-click="previous">Previous</button>
    <button phx-click="next">Next</button>
    <img src="<%= image(@idx) %>" />
    """
  end
  def handle_event("next", _event, socket) do
    {:noreply, assign_next_idx(socket)}
  end

  def handle_event("previous", _event, socket) do
    {:noreply, assign_prev_idx(socket)}
  end

  def assign_prev_idx(socket) do
    socket
    |> update(:idx, &(&1 - 1))
  end

  def assign_next_idx(socket) do
    socket
    |> update(:idx, &(&1 + 1))
  end

  def image(idx) do
    idx = rem(idx, @images_count)
    Enum.at(@images, idx)
  end

end