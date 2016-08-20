defmodule Fificards.Job do
  use Fificards.Web, :model

  schema "jobs" do
    belongs_to :action, Fificards.Action
    belongs_to :trigger, Fificards.Trigger

    field :trigger_at, Ecto.DateTime
    field :recurrs_when, :string

    timestamps()
  end

  @valid_attrs ~w(action_id trigger_id trigger_at recurrs_when)a
  @required_attrs ~w(action_id trigger_id trigger_at)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @valid_attrs)
    |> validate_required(@required_attrs)
  end
end
