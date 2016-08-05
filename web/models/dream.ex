defmodule DreamState.Dream do
  use DreamState.Web, :model

  schema "dreams" do
    field :content, :string
    field :completed_at, Ecto.DateTime

    timestamps()
  end

  @doc """
  Changeset that marks a Dream as achieved
  """
  def completed_changeset(struct, _params \\ %{}) do
    struct
    |> change(%{completed_at: Ecto.DateTime.utc})
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
