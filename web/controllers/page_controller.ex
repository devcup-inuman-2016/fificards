defmodule Fificards.PageController do
  use Fificards.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
