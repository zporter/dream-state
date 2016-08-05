defmodule DreamState.DreamTest do
  use DreamState.ModelCase

  alias DreamState.Dream
  alias Ecto.DateTime

  @valid_attrs %{content: "write solid code"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Dream.changeset(%Dream{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Dream.changeset(%Dream{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "completed_changeset marks dream as completed" do
    changeset = Dream.completed_changeset(%Dream{content: "just do it"})

    assert changeset.valid?
    assert changeset.changes[:completed_at] !== nil
  end
end
