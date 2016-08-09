defmodule DreamState.Repo.Migrations.CreateDream do
  use Ecto.Migration

  def change do
    create table(:dreams) do
      add :content, :text
      add :completed_at, :datetime

      timestamps()
    end

  end
end
