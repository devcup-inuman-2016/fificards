defmodule Fificards.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email,       :string
      add :first_name,  :string
      add :last_name,   :string
      add :role,        :string, default: "User"
      add :avatar,      :string
      add :uid,         :string
      add :token,       :string
      add :provider,    :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:uid])
  end
end
