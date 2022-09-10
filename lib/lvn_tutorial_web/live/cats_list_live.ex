defmodule CatAppWeb.CatsListLive do
  use CatAppWeb, :live_view
  require EEx

  EEx.function_from_file(
    :def,
    :render,
    "lib/lvn_tutorial_web/live/cats_list_live.ios.heex",
    [:assigns],
    engine: Phoenix.LiveView.HTMLEngine
  )

  @cats [
    "Clenil",
    "Flippers",
    "Jorts",
    "Kipper",
    "Lemmy",
    "Lissy",
    "Mikkel",
    "Minka",
    "Misty",
    "Nelly",
    "Ninj",
    "Pollito",
    "Siegfried",
    "Truman",
    "Washy"
  ]

  def mount(_params, _session, socket) do
    platform =
      case get_connect_params(socket) do
        %{"_platform" => "ios"} -> :ios
        _ -> :web
      end
    {:ok, assign(socket, platform: platform, cats: @cats)}
  end
end
