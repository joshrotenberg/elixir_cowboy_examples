defmodule EchoGet.TopPageHandler do
  def init(_transport, req, []) do
    {:ok, req, nil}
  end

  def handle(req, state) do
		{method, req} = :cowboy_req.method(req)
		{param, req} = :cowboy_req.qs_val("echo", req)
		{:ok, req} = echo(method, param, req)
    {:ok, req, state}
  end

	def echo("GET", :undefined, req) do
		:cowboy_req.reply(400, [], "Missing echo parameter.", req)
	end

	def echo("GET", param, req) do
		:cowboy_req.reply(200, [{"content-type", "text/plain; charset=utf-8"}], param, req)
	end

	def echo(_, _, req) do
		:cowboy_req.reply(405, req)
	end

  def terminate(_reason, _req, _state), do: :ok
end
