defmodule ShoutMotion.Repo.Migrations.CreatePlanCategories do
  use Ecto.Migration

  def change do
    create table(:plan_categories, primary_key: false) do
      add :plan_id, references(:plans, on_delete: :delete_all)
      add :category_id, references(:categories, on_delete: :delete_all)
    end

    create index(:plan_categories, [:plan_id])
    create index(:plan_categories, [:category_id])
    create unique_index(:plan_categories, [:plan_id, :category_id])
  end
end
