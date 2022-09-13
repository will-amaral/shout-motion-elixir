defmodule ShoutMotionWeb.Router do
  use ShoutMotionWeb, :router

  import ShoutMotionWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ShoutMotionWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShoutMotionWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/criar-conta", UserRegistrationController, :new
    post "/criar-conta", UserRegistrationController, :create
    get "/login", UserSessionController, :new
    post "/login", UserSessionController, :create
    get "/resetar-senha", UserResetPasswordController, :new
    post "/resetar-senha", UserResetPasswordController, :create
    get "/resetar-senha/:token", UserResetPasswordController, :edit
    put "/resetar-senha/:token", UserResetPasswordController, :update
  end

  scope "/", ShoutMotionWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/", PageController, :index
    resources "/financeiro/planos", PlanController
    get "/configuracoes", UserSettingsController, :edit
    put "/configuracoes", UserSettingsController, :update
    get "/configuracoes/confirmar-email/:token", UserSettingsController, :confirm_email
  end

  scope "/", ShoutMotionWeb do
    pipe_through [:browser]

    delete "/logout", UserSessionController, :delete
    get "/confirmar", UserConfirmationController, :new
    post "/confirmar", UserConfirmationController, :create
    get "/confirmar/:token", UserConfirmationController, :edit
    post "/confirmar/:token", UserConfirmationController, :update
  end

  # Development routes

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ShoutMotionWeb.Telemetry
    end
  end

  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
