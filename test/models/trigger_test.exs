defmodule Fificards.TriggerTest do
  use Fificards.ModelCase

  alias Fificards.Trigger

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Trigger.changeset(%Trigger{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Trigger.changeset(%Trigger{}, @invalid_attrs)
    refute changeset.valid?
  end
end
