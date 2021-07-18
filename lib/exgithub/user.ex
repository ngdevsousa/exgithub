defmodule Exgithub.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset

  @keys [:senha]
  @derive {Jason.Encoder, only: [:id]}

  schema "users" do
    field :senha, :string, virtual: true
    field :pwd_hash, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, @keys)
    |> validate_required(@keys)
    |> hash_password()
  end

  defp hash_password(%Changeset{valid?: true, changes: %{senha: password}} = changeset),
    do: change(changeset, Pbkdf2.add_hash(password, hash_key: :pwd_hash))

  defp hash_password(changeset), do: changeset
end
