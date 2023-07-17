defmodule Kurisu.Command.Ping do
  @moduledoc false

  use Kurisu.Command

  alias Nostrum.Api
  alias Nostrum.Util

  def data do
    %{
      name: "ping",
      description: "Pong!"
    }
  end

  def run(interaction) do
    pong! =
      Util.get_all_shard_latencies()
      |> Enum.map_join("\n", fn {shard, ping} ->
        "Shard **#{shard}** -> **#{ping}**ms"
      end)

    Api.create_interaction_response!(interaction, %{
      type: 4,
      data: %{
        content: pong!
      }
    })
  end
end
