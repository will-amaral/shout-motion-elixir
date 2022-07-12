defmodule Bump do
  @version_regex ~r/version:\s*"(\d+).(\d+).(\d+)"/

  @spec get_version([String.t()]) :: String.t()
  def get_version([new_version | _]), do: {:ok, "version: \"#{new_version}\""}
  def get_version([]), do: {:error, "You need to pass at least one argument"}

  def save_file(file), do: File.write("mix.exs", file)

  @spec update_mix_file(String.t()) :: String.t()
  def update_mix_file(version) do
    {:ok, file} = File.read("mix.exs")

    Regex.replace(@version_regex, file, version)
    |> save_file()
  end

  def load_args() do
    case System.argv() |> get_version() do
      {:ok, result} -> update_mix_file(result)
      {:error, error} -> error
    end
  end
end

Bump.load_args() |> IO.puts()
