defmodule Exgithub.Github.Behaviour do
  alias Exgithub.Error

  @callback fetch_user_repos(String.t()) :: {:ok, List.t()} | {:error, Error.t()}
end
