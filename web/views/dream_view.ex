defmodule DreamState.DreamView do
  use DreamState.Web, :view

  def render("index.json", %{dream: dream}) do
    %{data: render_many(dream, DreamState.DreamView, "dream.json")}
  end

  def render("show.json", %{dream: dream}) do
    %{data: render_one(dream, DreamState.DreamView, "dream.json")}
  end

  def render("dream.json", %{dream: dream}) do
    %{id: dream.id, content: dream.content}
  end
end
