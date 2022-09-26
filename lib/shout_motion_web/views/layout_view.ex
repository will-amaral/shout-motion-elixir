defmodule ShoutMotionWeb.LayoutView do
  use ShoutMotionWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  @routes [
    %{
      to: "/",
      text: "Home",
      icon: "home",
      allowed_roles: [:student, :instructor, :admin, :superadmin]
    },
    %{
      to: "/usuarios",
      text: "Usuários",
      icon: "people",
      allowed_roles: [:admin, :superadmin]
    },
    %{
      to: "/exercicios",
      text: "Exercícios",
      icon: "barbell",
      allowed_roles: [:instructor, :superadmin]
    },
    %{
      to: "/aulas",
      text: "Aulas",
      icon: "calendar",
      allowed_roles: [:student, :instructor, :admin, :superadmin]
    },
    %{
      to: "/financeiro",
      text: "Financeiro",
      icon: "cash",
      allowed_roles: [:student, :instructor, :admin, :superadmin]
    },
    %{
      to: "/mensagens",
      text: "Mensagens",
      icon: "chatbubbles",
      allowed_roles: [:student, :instructor, :admin, :superadmin]
    },
    %{
      to: "/relatorios",
      text: "Relatórios de Saúde",
      icon: "medkit",
      allowed_roles: [:student, :superadmin]
    },
    %{
      to: "/configuracoes",
      text: "Configurações",
      icon: "settings",
      allowed_roles: [:student, :instructor, :admin, :superadmin]
    }
  ]

  def get_path([]), do: ""

  def get_path([base_path | _]), do: base_path

  def active_link(path_info, path) do
    if "/#{get_path(path_info)}" == path, do: "active"
  end

  def get_paths(role) do
    Enum.filter(@routes, fn %{allowed_roles: allowed_roles} ->
      Enum.member?(allowed_roles, role)
    end)
  end
end
