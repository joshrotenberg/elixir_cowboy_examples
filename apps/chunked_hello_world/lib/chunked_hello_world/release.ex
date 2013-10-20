defmodule ChunkedHellowWorld.Release do
  use Relex.Release

  def name, do: "chunked_hello_world"
  def version, do: "1"

  def applications, do: [:chunked_hello_world]
end