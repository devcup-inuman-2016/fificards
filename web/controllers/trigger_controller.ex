defmodule Fificards.ActionController do
  use Fificards.Web, :controller

  plug :scrub_params, :action when action in [:create, :update]

  alias Fificards.{ Repo, Action }

  def index(conn, _) do
    actions =
      Repo.all(Action)

    render(conn, "index.html", actions: actions)
  end

  def new(conn, _) do
    changeset =
      Action.changeset(%Action{})

    render(conn, "new.html", changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    action =
      Repo.get!(Action, id)
    changeset =
      Action.changeset(action, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    action =
      Repo.get!(Action, id)

    render(conn, "show.html", action: action)
  end

  def create(conn, %{"action" => action_params}) do
    changeset = 
      Action.changeset(%Action{}, action_params)

    case Repo.insert(changeset) do
      {:ok, action} ->
        conn
        |> redirect(to: action_path(conn, :show, action)) 
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "action" => action_params }) do
    action =
      Repo.get!(Action, id)
    changeset = 
      Action.changeset(action, action_params)

    case Repo.update(changeset) do
      {:ok, action} ->
        conn
        |> redirect(to: action_path(conn, :show, action)) 
      {:error, changeset} ->
        conn
        |> render("edit.html", changeset: changeset)
    end
  end


end
