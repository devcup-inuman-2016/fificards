defmodule Fificards.User do
  use Fificards.Web, :model

  schema "users" do
    field :email,       :string
    field :first_name,  :string
    field :last_name,   :string
    field :role,        :string
    field :avatar,      :string
    field :uid,         :string
    field :token,       :string
    field :provider,    :string

    timestamps()
  end

  @valid_attrs ~w(email first_name last_name role avatar uid token provider)a
  @required_attrs ~w(email first_name last_name avatar uid token provider)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @valid_attrs)
    |> validate_required(@required_attrs)
  end
end
