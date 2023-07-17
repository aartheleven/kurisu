defmodule Kurisu.Consumer do
  @moduledoc false

  use Nostrum.Consumer

  alias Kurisu.Registry

  def handle_event({:READY, _arg, _state}) do
    Registry.register()
  end

  def handle_event({:INTERACTION_CREATE, interaction, _state}) do
    command =
      Registry.get(interaction.data.name)

    if command do
      command.run(interaction)
    end
  end

  def handle_event(_event) do
    :ok
  end
end
