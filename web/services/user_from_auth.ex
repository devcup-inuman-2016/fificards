defmodule UserFromAuth do
  alias Ueberauth.Auth
  alias Fificards.Repo
  alias Fificards.User
  import Ecto.Query, only: [from: 2]

  def find_or_create(%Auth{provider: :identity} = auth) do
    case validate_pass(auth.credentials) do
      :ok ->
        {:ok, basic_info(auth)}
      {:error, reason} -> 
        {:error, reason}
    end
  end

  def find_or_create(%Auth{} = auth) do
    {:ok, find_user(auth)}
  end

  defp basic_info(auth) do  
    IO.inspect auth
    %{uid:          auth.uid,
      email:        auth.info.email,
      first_name:   auth.info.first_name,
      last_name:    auth.info.last_name,
      provider:     "Github",
      avatar:       auth.info.image}
  end

  defp find_user(%{uid: uid} = auth) do
    user = Repo.one(from u in User,
                    where: u.uid == ^uid)

    case user do
      nil ->
        insert_user(auth)
      _ -> 
        user
    end
  end

  defp insert_user(auth) do
    changeset = User.changeset(%User{}, basic_info(auth))

    case Repo.insert(changeset) do
      {:ok, user} -> 
        user
      {:error, changeset} ->
        {:error, changeset}
    end
  end

  defp validate_pass(%{other: %{password: ""}}), do: {:error, "Password required"}
  defp validate_pass(%{other: %{password: pw, password_confirmation: pw}}), do: :ok
  defp validate_pass(%{other: %{password: _}}), do: {:error, "Passwords do not match"}
  defp validate_pass(_), do: {:error, "Password Required"}
end

