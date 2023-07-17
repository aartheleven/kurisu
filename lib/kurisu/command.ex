defmodule Kurisu.Command do
  @moduledoc false

  alias Nostrum.Struct.{ApplicationCommand, ApplicationCommandInteractionData}
  alias Nostrum.Interaction

  @callback data() :: ApplicationCommand.application_command_map()
  @callback run(Interaction.t()) :: any()

  defmacro __using__(_opts) do
    quote do
      @behaviour unquote(__MODULE__)

      @spec get_option(Interaction.t(), String.t()) ::
              ApplicationCommandInteractionData.options() | nil
      defp get_option(interaction, option) do
        (interaction.data.options || [])
        |> Enum.find(& &1.name == option)
      end
    end
  end
end
