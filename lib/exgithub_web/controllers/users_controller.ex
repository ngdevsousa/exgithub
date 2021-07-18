defmodule ExgithubWeb.UsersController do
  use ExgithubWeb, :controller

  alias Exgithub.User
  alias ExgithubWeb.{Auth.Guardian, FallbackController}

  action_fallback FallbackController

  def login(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("login.json", token: token)
    end
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- Exgithub.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("created.json", token: token, user: user)
    end
  end
end
