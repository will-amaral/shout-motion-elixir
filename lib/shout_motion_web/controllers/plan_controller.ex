defmodule ShoutMotionWeb.PlanController do
  use ShoutMotionWeb, :controller

  alias ShoutMotion.Catalog
  alias ShoutMotion.Catalog.Plan

  def index(conn, _params) do
    plans = Catalog.list_plans()
    render(conn, "index.html", plans: plans)
  end

  def new(conn, _params) do
    changeset = Catalog.change_plan(%Plan{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"plan" => plan_params}) do
    case Catalog.create_plan(plan_params) do
      {:ok, plan} ->
        conn
        |> put_flash(:info, "Plan created successfully.")
        |> redirect(to: Routes.plan_path(conn, :show, plan))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plan = Catalog.get_plan!(id)
    render(conn, "show.html", plan: plan)
  end

  def edit(conn, %{"id" => id}) do
    plan = Catalog.get_plan!(id)
    changeset = Catalog.change_plan(plan)
    render(conn, "edit.html", plan: plan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plan" => plan_params}) do
    plan = Catalog.get_plan!(id)

    case Catalog.update_plan(plan, plan_params) do
      {:ok, plan} ->
        conn
        |> put_flash(:info, "Plan updated successfully.")
        |> redirect(to: Routes.plan_path(conn, :show, plan))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", plan: plan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plan = Catalog.get_plan!(id)
    {:ok, _plan} = Catalog.delete_plan(plan)

    conn
    |> put_flash(:info, "Plan deleted successfully.")
    |> redirect(to: Routes.plan_path(conn, :index))
  end
end
