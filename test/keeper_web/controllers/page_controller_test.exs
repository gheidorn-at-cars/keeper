defmodule KeeperWeb.PageControllerTest do
  use KeeperWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "canvas"
  end
end
