defmodule CatAppWeb.Components do
  import Phoenix.Component
  import Phoenix.LiveView.Helpers

  def list(%{platform: :ios} = assigns) do
    attrs = get_valid_attrs(assigns)
    ~H"""
    <list {attrs}>
      <%= render_slot(@inner_block) %>
    </list>
    """
  end

  def list(%{platform: :web} = assigns) do
    attrs = get_valid_attrs(assigns)
    title = Keyword.get(attrs, :"nav-title")

    ~H"""
    <ul class="flex flex-col m-4 border-b children:py-1 children:space-x-2 children:border-t last:border-b">
      <%= if title do %>
        <li class="text-3xl font-bold border-none"><%= title %></li>
      <% else %>
        <li></li>
      <% end %>
      <%= render_slot(@inner_block) %>
    </ul>
    """
  end

  def asyncimage(%{platform: :ios} = assigns) do
    attrs = get_valid_attrs(assigns)
    ~H"""
    <asyncimage src={@src} {attrs} />
    """
  end

  def asyncimage(%{platform: :web} = assigns) do
    attrs = get_valid_attrs(assigns)
    width = Keyword.get(attrs, :"frame-width")
    height = Keyword.get(attrs, :"frame-width")
    ~H"""
    <img src={@src} width={"#{width}px"} height={"#{height}px"} {attrs} />
    """
  end

  def text(%{platform: :ios} = assigns) do
    attrs = get_valid_attrs(assigns)
    ~H"""
    <text {attrs}><%= render_slot(@inner_block) %></text>
    """
  end

  def text(%{platform: :web} = assigns) do
    attrs = get_valid_attrs(assigns)
    ~H"""
    <p {attrs}><%= render_slot(@inner_block) %></p>
    """
  end

  def hstack(%{platform: :ios} = assigns) do
    attrs = get_valid_attrs(assigns)
    ~H"""
    <hstack {attrs}><%= render_slot(@inner_block) %></hstack>
    """
  end

  def hstack(%{platform: :web} = assigns) do
    attrs = get_valid_attrs(assigns)
    ~H"""
    <section class="flex items-center gap-x-1" {attrs}><%= render_slot(@inner_block) %></section>
    """
  end

  def vstack(%{platform: :ios} = assigns) do
    attrs = get_valid_attrs(assigns)
    ~H"""
    <vstack {attrs}><%= render_slot(@inner_block) %></vstack>
    """
  end

  def vstack(%{platform: :web} = assigns) do
    attrs = get_valid_attrs(assigns)
    title = Keyword.get(attrs, :"nav-title")

    ~H"""
    <section class="flex flex-col gap-y-1" {attrs}>
      <%= if title do %>
        <div class="text-3xl font-bold border-none"><%= title %></div>
        <div class="flex items-center justify-center h-screen">
          <%= render_slot(@inner_block) %>
        </div>
      <% else %>
        <div><%= render_slot(@inner_block) %></div>
      <% end %>
    </section>
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

  def image(%{platform: :ios} = assigns) do
    attrs = get_valid_attrs(assigns)
    ~H"""
    <image {attrs} />
    """
  end

  def image(%{platform: :web} = assigns) do
    attrs = get_valid_attrs(assigns)
    icon_name = Keyword.get(attrs, :"system-name")
    text_color = case Keyword.get(attrs, :"system-color", "#000000") do
      "#f3c51a" -> "text-[#f3c51a]"
      "#000000" -> "text-black"
    end

    ~H"""
    <span class={"#{text_color}"}>
      <.icon icon={icon_name} />
    </span>
    """
  end

  def navigationlink(%{platform: :ios} = assigns) do
    attrs = get_valid_attrs(assigns)
    ~H"""
    <navigationlink {attrs}><%= render_slot(@inner_block) %></navigationlink>
    """
  end

  def navigationlink(%{platform: :web} = assigns) do
    attrs = get_valid_attrs(assigns)
    href = Keyword.get(attrs, :"data-phx-href", "#")
    target = Keyword.get(attrs, :"data-phx-target", "_self")

    ~H"""
    <a href={href} target={target} {attrs}><%= render_slot(@inner_block) %></a>
    """
  end

  # only web
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

  defp get_valid_attrs(assigns) do
    assigns
    |> assigns_to_attributes()
    |> Keyword.delete(:platform)
  end
end
