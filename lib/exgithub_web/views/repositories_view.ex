defmodule ExgithubWeb.RepositoriesView do
  use ExgithubWeb, :view

  def render("show.json", %{repos: repos}), do: %{repos: repos}
end
