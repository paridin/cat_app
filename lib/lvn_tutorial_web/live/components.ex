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
    <ul class="flex flex-col m-4
      [&>*]:py-1 [&>*]:items-center [&>*]:space-x-2 [&>*]:border-t
      [&>*]:cursor-pointer
      border-b">
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

  def spacer(%{platform: :ios} = assigns) do
    ~H"""
    <spacer />
    """
  end

  def spacer(%{platform: :web} = assigns) do
    ~H"""
    <div class="flex-1"></div>
    """
  end

  def image(%{platform: :ios, "system-name": icon_name, "symbol-color": color} = assigns) do
    ~H"""
    <image system-name={icon_name} symbol-color={color} />
    """
  end

  def image(%{platform: :web, "system-name": icon_name, "symbol-color": color} = assigns) do
    text_color = case color do
      "#f3c51a" -> "text-[#f3c51a]"
      "#000000" -> "text-black"
    end

    ~H"""
    <span class={"#{text_color}"}>
      <.icon icon={icon_name} />
    </span>
    """
  end

  def icon(%{icon: "star"} = assigns) do
    ~H"""
    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z" /></svg>
    """
  end

  def icon(%{icon: "star.fill"} = assigns) do
    ~H"""
    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" /></svg>
    """
  end
end
