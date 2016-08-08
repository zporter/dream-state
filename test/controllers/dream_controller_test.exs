defmodule DreamState.DreamControllerTest do
  use DreamState.ConnCase

  alias DreamState.Dream
  @valid_attrs %{content: "I have a dream"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  # test "lists all entries on index", %{conn: conn} do
  #   conn = get conn, dream_path(conn, :index)
  #   assert json_response(conn, 200)["data"] == []
  # end

  # test "shows chosen resource", %{conn: conn} do
  #   dream = Repo.insert! %Dream{}
  #   conn = get conn, dream_path(conn, :show, dream)
  #   assert json_response(conn, 200)["data"] == %{"id" => dream.id}
  # end

  # test "renders page not found when id is nonexistent", %{conn: conn} do
  #   assert_error_sent 404, fn ->
  #     get conn, dream_path(conn, :show, -1)
  #   end
  # end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, dream_path(conn, :create), dream: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert json_response(conn, 201)["data"]["content"] == "I have a dream"
    assert Repo.get_by(Dream, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, dream_path(conn, :create), dream: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  # test "updates and renders chosen resource when data is valid", %{conn: conn} do
  #   dream = Repo.insert! %Dream{}
  #   conn = put conn, dream_path(conn, :update, dream), dream: @valid_attrs
  #   assert json_response(conn, 200)["data"]["id"]
  #   assert Repo.get_by(Dream, @valid_attrs)
  # end

  # test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
  #   dream = Repo.insert! %Dream{}
  #   conn = put conn, dream_path(conn, :update, dream), dream: @invalid_attrs
  #   assert json_response(conn, 422)["errors"] != %{}
  # end

  # test "deletes chosen resource", %{conn: conn} do
  #   dream = Repo.insert! %Dream{}
  #   conn = delete conn, dream_path(conn, :delete, dream)
  #   assert response(conn, 204)
  #   refute Repo.get(Dream, dream.id)
  # end
end
