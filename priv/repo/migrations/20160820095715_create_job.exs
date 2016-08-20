defmodule Fificards.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :action_id, references(:actions)
      add :trigger_id, references(:triggers)

      timestamps()
    end

    create index(:jobs, [:action_id, :trigger_id])
  end
end
