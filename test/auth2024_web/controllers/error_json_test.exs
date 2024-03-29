defmodule Auth2024Web.ErrorJSONTest do
  use Auth2024Web.ConnCase, async: true

  test "renders 404" do
    assert Auth2024Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Auth2024Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
