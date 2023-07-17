defmodule Kurisu.MixProject do
  use Mix.Project

  def project do
    [
      app: :kurisu,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Kurisu.Application, []}
    ]
  end

  defp deps do
    [
      {:nostrum, "~> 0.8.0"},
      {:ecto_sql, "~> 3.10"},
      {:postgrex, "~> 0.17.1"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
  end
end
