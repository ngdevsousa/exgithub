defmodule Exgithub.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :pwd_hash, :string

      timestamps()
    end
  end
end
