defmodule Cookie.TopPageHandler do
  def init(_transport, req, []) do
    {:ok, req, nil}
  end

  def handle(req, state) do
    new_value = integer_to_list(:random.uniform(1000000))
    req = :cowboy_req.set_resp_cookie("server", new_value, [path: "/"], req)
    {client_cookie, req} = :cowboy_req.cookie("client", req)
    {server_cookie, req} = :cowboy_req.cookie("server", req)
    body = :cookie_template.toppage([client: client_cookie, server: server_cookie])
    {:ok, req} = :cowboy_req.reply(200, [{"content-type", "text/html"}], body, req)
    {:ok, req, state}
  end

  def terminate(_reason, _req, _state), do: :ok
end
