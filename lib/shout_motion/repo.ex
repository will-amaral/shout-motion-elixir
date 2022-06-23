defmodule ShoutMotion.Repo do
  use Ecto.Repo,
    otp_app: :shout_motion,
    adapter: Ecto.Adapters.Postgres
end
