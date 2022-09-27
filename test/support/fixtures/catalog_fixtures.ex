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
        price: "120.500000",
        title: "some title",
        views: 42
      })
      |> ShoutMotion.Catalog.create_plan()

    plan
  end

  @doc """
  Generate a unique category title.
  """
  def unique_category_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        title: unique_category_title()
      })
      |> ShoutMotion.Catalog.create_category()

    category
  end
end
