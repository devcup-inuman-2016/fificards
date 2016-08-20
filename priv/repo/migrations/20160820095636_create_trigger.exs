defmodule Fificards.Repo.Migrations.CreateTrigger do
  use Ecto.Migration

  def change do
    create table(:triggers) do
      add :name,  :string
      add :description, :text

      add :script, :text

      timestamps()
    end
  end
end
