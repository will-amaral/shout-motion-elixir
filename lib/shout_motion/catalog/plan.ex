defmodule ShoutMotion.Catalog.Plan do
  use Ecto.Schema
  import Ecto.Changeset

  alias ShoutMotion.Catalog.Category

  schema "plans" do
    field :description, :string
    field :price, :decimal
    field :title, :string
    field :views, :integer

    many_to_many :categories, Category, join_through: "plan_categories", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(plan, attrs) do
    plan
    |> cast(attrs, [:title, :description, :price, :views])
    |> validate_required([:title, :description, :price, :views])
  end
end
