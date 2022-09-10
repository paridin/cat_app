defmodule CatAppWeb.PageController do
  use CatAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
