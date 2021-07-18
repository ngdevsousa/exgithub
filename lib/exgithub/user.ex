defmodule Exgithub.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset

  @keys [:name, :password]
  @derive {Jason.Encoder, only: [:id, :name]}

  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :pwd_hash, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, @keys)
    |> validate_required(@keys)
    |> unique_constraint([:name])
    |> hash_password()
  end

  defp hash_password(%Changeset{valid?: true, changes: %{password: password}} = changeset),
    do: change(changeset, Pbkdf2.add_hash(password, hash_key: :pwd_hash))

  defp hash_password(changeset), do: changeset
end
