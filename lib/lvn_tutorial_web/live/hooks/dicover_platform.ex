defmodule CatAppWeb.Live.Hooks.DicoverPlatform do
  @moduledoc false
  import Phoenix.LiveView

  def on_mount(:default, _params, _session, socket) do
    platform =
      case get_connect_params(socket) do
        %{"_platform" => "ios"} -> :ios
        _ -> :web
      end
      |>  IO.inspect(label: :platform)
    {:cont, assign(socket, platform: platform)}
  end
end
