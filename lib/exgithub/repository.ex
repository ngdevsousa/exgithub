defmodule Exgithub.Repository do
  @keys [:id, :name, :description, :html_url, :stargazers_count]
  @derive {Jason.Encoder, only: @keys}

  defstruct @keys

  def build(%{
        "id" => id,
        "name" => name,
        "description" => desc,
        "html_url" => url,
        "stargazers_count" => count
      }) do
    %__MODULE__{id: id, name: name, description: desc, html_url: url, stargazers_count: count}
  end
end
