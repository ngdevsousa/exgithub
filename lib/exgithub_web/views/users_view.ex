defmodule ExgithubWeb.UsersView do
  use ExgithubWeb, :view
  alias Exgithub.User

  def render("created.json", %{token: token, user: %User{} = user}) do
    %{
      token: token,
      message: "User created",
      user: user
    }
  end

  def render("login.json", %{token: token}), do: %{token: token}
end
