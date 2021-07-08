defmodule ExgithubWeb.RepositoriesController do
  use ExgithubWeb, :controller

  alias ExgithubWeb.FallbackController

  action_fallback FallbackController

  def index(conn, %{"username" => username}) do
    with {:ok, repos} <- Exgithub.get_repos(username) do
      conn
      |> put_status(:ok)
      |> render("show.json", repos: repos)
    end
  end
end
