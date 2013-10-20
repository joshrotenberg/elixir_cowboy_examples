defmodule ElixirCowboyExamples.Mixfile do
  use Mix.Project

  def project do
    [ apps_path: "apps",
      deps: deps ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  # These dependencies are not accessible from child applications
  defp deps do
    [{:cowboy, github: "extend/cowboy"}]
  end
end
