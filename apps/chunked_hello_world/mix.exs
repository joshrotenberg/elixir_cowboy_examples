defmodule ChunkedHelloWorld.Mixfile do
  use Mix.Project

  def project do
    [ app: :chunked_hello_world,
      version: "0.0.1",
      elixir: "~> 0.10.3",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { ChunkedHelloWorld, [] },
      applications: [:cowboy] ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [{:cowboy, github: "extend/cowboy"}]
  end
end
