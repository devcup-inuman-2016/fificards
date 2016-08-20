defmodule Fificards.Trigger do
  use Fificards.Web, :model

  schema "triggers" do
    field :name,        :string
    field :description, :string
    field :script,      :string

    timestamps()
  end

  @valid_attrs ~w(name description script)a
  @required_attrs ~w(name description script)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @valid_attrs)
    |> validate_required(@required_attrs)
  end
end
