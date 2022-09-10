defmodule CatAppWeb.Components do
  import Phoenix.Component
  import Phoenix.LiveView.Helpers

  def list(%{platform: :ios} = assigns) do
    ~H"""
    <list>
      <%= render_slot(@inner_block) %>
    </list>
    """
  end

  def list(%{platform: :web} = assigns) do
    ~H"""
    <ul class="flex flex-col m-4 [&>*]:py-1 [&>*]:items-center [&>*]:space-x-2 [&>*]:border-t border-b">
      <%= render_slot(@inner_block) %>
    </ul>
    """
  end

  def asyncimage(%{platform: :ios, "frame-width": width, "frame-height": height} = assigns) do
    ~H"""
    <asyncimage src={@src} frame-width={width} frame-height={height} />
    """
  end

  def asyncimage(%{platform: :web, "frame-width": width, "frame-height": height} = assigns) do
    ~H"""
    <img src={@src} width={"#{width}px"} height={"#{height}px"} />
    """
  end

  def text(%{platform: :ios} = assigns) do
    ~H"""
    <text><%= render_slot(@inner_block) %></text>
    """
  end

  def text(%{platform: :web} = assigns) do
    ~H"""
    <p><%= render_slot(@inner_block) %></p>
    """
  end

  def hstack(%{platform: :ios, id: id} = assigns) do
    ~H"""
    <hstack id={id}><%= render_slot(@inner_block) %></hstack>
    """
  end

  def hstack(%{platform: :web, id: id} = assigns) do
    ~H"""
    <section id={id} class="flex"><%= render_slot(@inner_block) %></section>
    """
  end

  def vstack(%{platform: :ios, id: id} = assigns) do
    ~H"""
    <hstack id={id}><%= render_slot(@inner_block) %></hstack>
    """
  end

  def vstack(%{platform: :web, id: id} = assigns) do
    ~H"""
    <section id={id} class="flex flex-col"><%= render_slot(@inner_block) %></section>
    """
  end
end
