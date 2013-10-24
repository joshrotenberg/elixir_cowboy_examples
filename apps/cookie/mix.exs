Code.append_path "deps/relex/ebin"
Code.append_path "deps/pogo/ebin"
defmodule Cookie.Mixfile do
  use Mix.Project

  def project do
    [ app: :cookie,
      version: "0.0.1",
      elixir: "~> 0.10.3",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { Cookie, [] },
     applications: [:cowboy] ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", github: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [{:cowboy, github: "extend/cowboy"},
     {:exlydtl, github: "joshrotenberg/exlydtl"},
     {:erlydtl, github: "evanmiller/erlydtl", override: true},
     {:relex, github: "interline/relex"},
     {:pogo, github: "onkel-dirtus/pogo"}]
  end

  if Enum.all?([Relex.Release, Pogo.Release], &Code.ensure_loaded?/1) do
    defmodule Release do
      use Relex.Release
      use Pogo.Release

      def name, do: "cookie"
      def version, do: Mix.project[:version]
      def applications, do: [:pogo, Mix.project[:app]]
      #def lib_dirs, do: ["deps"]
    end
  end
end
