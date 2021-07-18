defmodule Exgithub do
  alias Exgithub.Repositories.Get, as: GetRepos

  alias Exgithub.Users.Create, as: CreateUser
  alias Exgithub.Users.Get, as: GetUser

  defdelegate get_repos(username), to: GetRepos, as: :call

  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate get_user(params), to: GetUser, as: :by_id
end
