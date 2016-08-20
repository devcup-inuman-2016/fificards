defmodule Fificards.Auth.UserController do
  use Fificards.Web, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

  def request(conn, _) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_failure: _ }} = conn, _) do
    conn
    |> put_flash(:error, "Failed to authenticate using Facebook")
    |> redirect(to: page_path(conn, :index))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _) do
    IO.inspect auth
    case UserFromAuth.find_or_create(auth) do
      {:ok, user} ->
        conn
        |> Fificards.Auth.login(user)
        |> put_flash(:info, "Successfully authenticated using Facebook")
        |> redirect(to: page_path(conn, :index))
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: page_path(conn, :index))
    end
  end

  def logout(conn, _) do
    conn 
    |> put_flash(:info, "You have been logged out")
    |> configure_session(drop: true) 
    |> redirect(to: page_path(conn, :index))
  end

end

