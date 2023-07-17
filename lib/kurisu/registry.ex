defmodule Kurisu.Registry do
  @moduledoc false

  alias Nostrum.Api

  @commands [
    Kurisu.Command.Ping
  ]

  def register do
    @commands
    |> Enum.map(& &1.data)
    |> Api.bulk_overwrite_global_application_commands()
  end

  def get(name) do
    @commands
    |> Enum.find(& &1.data.name == name)
  end
end
