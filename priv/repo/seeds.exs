# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ShoutMotion.Repo.insert!(%ShoutMotion.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
for title <- ["Musculação", "Funcional", "Crossfit", "Natação"] do
  {:ok, _} = ShoutMotion.Catalog.create_category(%{title: title})
end
