defmodule ShoutMotionWeb.PageControllerTest do
  use ShoutMotionWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert redirected_to(conn) == "/login"
  end
end
