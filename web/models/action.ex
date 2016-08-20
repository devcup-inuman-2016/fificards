defmodule Fificards.Action do
  use Fificards.Web, :model

  schema "actions" do
    field :name,          :string
    field :description,   :string

    field :commands,      :string

    timestamps()
  end

  @valid_attrs ~w(name description scripts)a
  @required_attrs ~w(name description scripts)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @valid_attrs)
    |> validate_required(@required_attrs)
  end
end
