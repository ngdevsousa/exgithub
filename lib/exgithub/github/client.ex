defmodule Exgithub.Github.Client do
  use Tesla

  alias Exgithub.Error
  alias Exgithub.Github.Behaviour
  alias Exgithub.Repository
  alias Tesla.Env

  @behaviour Behaviour

  @default_url "https://api.github.com/users"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Headers, [{"User-Agent", "ExGithub Development"}]

  def fetch_user_repos(url \\ @default_url, username) do
    "#{url}/#{username}/repos"
    |> get()
    |> handle_response()
  end

  defp handle_response({:ok, %Env{status: 404, body: _body}}) do
    {:error, Error.build(:not_found, "Repo not found")}
  end

  defp handle_response({:ok, %Env{status: 200, body: body}}) do
    response = Enum.map(body, &Repository.build/1)

    {:ok, response}
  end

  defp handle_response({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end
end
