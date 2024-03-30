defmodule Auth2024Web.GithubAuthController do
  use Auth2024Web, :controller
  alias Auth2024Web.GithubAuth

  def request(conn, _params) do
    GithubAuth.request(conn)
  end

  def callback(conn, _params) do
    GithubAuth.callback(conn)
  end
end
