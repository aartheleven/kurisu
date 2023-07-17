defmodule Kurisu.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    Supervisor.start_link([
      Kurisu.Consumer,
      Kurisu.Repo
    ], strategy: :one_for_one)
  end
end
