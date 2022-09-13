defmodule ShoutMotion.CatalogTest do
  use ShoutMotion.DataCase

  alias ShoutMotion.Catalog

  describe "plans" do
    alias ShoutMotion.Catalog.Plan

    import ShoutMotion.CatalogFixtures

    @invalid_attrs %{description: nil, price: nil, title: nil, views: nil}

    test "list_plans/0 returns all plans" do
      plan = plan_fixture()
      assert Catalog.list_plans() == [plan]
    end

    test "get_plan!/1 returns the plan with given id" do
      plan = plan_fixture()
      assert Catalog.get_plan!(plan.id) == plan
    end

    test "create_plan/1 with valid data creates a plan" do
      valid_attrs = %{description: "some description", price: "120.5", title: "some title", views: 42}

      assert {:ok, %Plan{} = plan} = Catalog.create_plan(valid_attrs)
      assert plan.description == "some description"
      assert plan.price == Decimal.new("120.5")
      assert plan.title == "some title"
      assert plan.views == 42
    end

    test "create_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_plan(@invalid_attrs)
    end

    test "update_plan/2 with valid data updates the plan" do
      plan = plan_fixture()
      update_attrs = %{description: "some updated description", price: "456.7", title: "some updated title", views: 43}

      assert {:ok, %Plan{} = plan} = Catalog.update_plan(plan, update_attrs)
      assert plan.description == "some updated description"
      assert plan.price == Decimal.new("456.7")
      assert plan.title == "some updated title"
      assert plan.views == 43
    end

    test "update_plan/2 with invalid data returns error changeset" do
      plan = plan_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_plan(plan, @invalid_attrs)
      assert plan == Catalog.get_plan!(plan.id)
    end

    test "delete_plan/1 deletes the plan" do
      plan = plan_fixture()
      assert {:ok, %Plan{}} = Catalog.delete_plan(plan)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_plan!(plan.id) end
    end

    test "change_plan/1 returns a plan changeset" do
      plan = plan_fixture()
      assert %Ecto.Changeset{} = Catalog.change_plan(plan)
    end
  end
end
