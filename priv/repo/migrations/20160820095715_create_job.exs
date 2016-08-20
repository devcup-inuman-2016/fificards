defmodule Fificards.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :action_id, references(:actions)
      add :trigger_id, references(:triggers)
      
      add :trigger_at, :datetime
      add :recurrs_when, :string

      timestamps()
    end

    create index(:jobs, [:action_id, :trigger_id])
  end
end
