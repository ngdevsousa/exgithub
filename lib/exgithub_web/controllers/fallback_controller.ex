defmodule ExgithubWeb.FallbackController do
  use ExgithubWeb, :controller

  alias Exgithub.Error
  alias ExgithubWeb.ErrorView

  def call(conn, {:error, %Error{status: status, reason: reason}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", reason: reason)
  end
end
