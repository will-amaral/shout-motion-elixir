defmodule ShoutMotion.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ShoutMotion.Catalog` context.
  """

  @doc """
  Generate a plan.
  """
  def plan_fixture(attrs \\ %{}) do
    {:ok, plan} =
      attrs
      |> Enum.into(%{
        description: "some description",
        price: "120.5",
        title: "some title",
        views: 42
      })
      |> ShoutMotion.Catalog.create_plan()

    plan
  end
end
