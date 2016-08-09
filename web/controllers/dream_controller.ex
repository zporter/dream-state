defmodule DreamState.DreamController do
  use DreamState.Web, :controller

  alias DreamState.Dream

  # def index(conn, _params) do
  #   dream = Repo.all(Dream)
  #   render(conn, "index.json", dream: dream)
  # end

  def create(conn, %{"dream" => dream_params}) do
    changeset = Dream.changeset(%Dream{}, dream_params)

    case Repo.insert(changeset) do
      {:ok, dream} ->
        conn
        |> put_status(:created)
        # |> put_resp_header("location", dream_path(conn, :show, dream))
        |> render("show.json", dream: dream)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DreamState.ChangesetView, "error.json", changeset: changeset)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   dream = Repo.get!(Dream, id)
  #   render(conn, "show.json", dream: dream)
  # end

  # def update(conn, %{"id" => id, "dream" => dream_params}) do
  #   dream = Repo.get!(Dream, id)
  #   changeset = Dream.changeset(dream, dream_params)

  #   case Repo.update(changeset) do
  #     {:ok, dream} ->
  #       render(conn, "show.json", dream: dream)
  #     {:error, changeset} ->
  #       conn
  #       |> put_status(:unprocessable_entity)
  #       |> render(DreamState.ChangesetView, "error.json", changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   dream = Repo.get!(Dream, id)

  #   # Here we use delete! (with a bang) because we expect
  #   # it to always work (and if it does not, it will raise).
  #   Repo.delete!(dream)

  #   send_resp(conn, :no_content, "")
  # end
end
