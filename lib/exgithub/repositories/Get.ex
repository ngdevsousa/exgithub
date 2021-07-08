defmodule Exgithub.Repositories.Get do
  alias Exgithub.Error

  def call(username) do
    with {:ok, repos} <- client().fetch_user_repos(username) do
      {:ok, repos}
    else
      {:error, %Error{}} = error -> error
      {:error, reason} -> {:error, Error.build(:bad_request, reason)}
    end
  end

  defp client(),
    do: :exgithub |> Application.fetch_env!(__MODULE__) |> Keyword.get(:github_adapter)
end
