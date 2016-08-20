defmodule Fificards.Repo.Migrations.CreateAction do
  use Ecto.Migration

  def change do
    create table(:actions) do
      add :name, :string
      add :description, :text

      add :commands, :text


      timestamps()
    end

  end
end
