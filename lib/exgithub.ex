defmodule Exgithub do
  alias Exgithub.Repositories.Get, as: GetRepos

  defdelegate get_repos(username), to: GetRepos, as: :call
end
