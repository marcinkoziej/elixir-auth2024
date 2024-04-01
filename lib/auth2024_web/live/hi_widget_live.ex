defmodule Auth2024Web.HiWidgetLive do
  use Auth2024Web, :live_view

  on_mount {Auth2024Web.UserAuth, :mount_current_user}
  # on_mount {Auth2024Web.GithubAuth, :mount_current_user}

  def render(assigns) do
    if assigns[:current_user] do
      ~H"""
      <div>👋 Hi, <%= @current_user.email %></div>
      """
    else
      ~H"""
      <div>🤔 Do I know you?</div>
      """
    end
  end

  @spec mount_(any(), nil | maybe_improper_list() | map(), any()) :: {:ok, any()}
  def mount_(_params, session, socket) do
    with token when is_bitstring(token) <- session["user_token"],
      user when not is_nil(user) <- Auth2024.Accounts.get_user_by_session_token(token) do
      {:ok, assign(socket, current_user: user)}
    else
      _ -> {:ok, socket}
    end
  end
end
