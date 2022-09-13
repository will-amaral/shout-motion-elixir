defmodule ShoutMotion.Repo.Migrations.CreatePlans do
  use Ecto.Migration

  def change do
    create table(:plans) do
      add :title, :string
      add :description, :string
      add :price, :decimal, precision: 15, scale: 6, null: false
      add :views, :integer, default: 0, null: false

      timestamps()
    end
  end
end
