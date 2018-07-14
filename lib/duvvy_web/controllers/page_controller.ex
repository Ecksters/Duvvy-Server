defmodule DuvvyWeb.PageController do
  use DuvvyWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
