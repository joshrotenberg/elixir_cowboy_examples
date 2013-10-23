defmodule CompressResponse.TopPageHandler do
	def init(_transport, req, []) do
		{:ok, req, nil}
	end

	def handle(req, state) do
		big_body = """
A cowboy is an animal herder who tends cattle on ranches in North America,
traditionally on horseback, and often performs a multitude of other ranch-
related tasks. The historic American cowboy of the late 19th century arose
from the vaquero traditions of northern Mexico and became a figure of special
significance and legend. A subtype, called a wrangler, specifically tends the
horses used to work cattle. In addition to ranch work, some cowboys work for
or participate in rodeos. Cowgirls, first defined as such in the late 19th
century, had a less-well documented historical role, but in the modern world
have established the ability to work at virtually identical tasks and obtained
considerable respect for their achievements. There are also cattle handlers
in many other parts of the world, particularly South America and Australia,
who perform work similar to the cowboy in their respective nations.\n
"""
		{:ok, req} = :cowboy_req.reply(200, [], big_body, req)
		{:ok, req, state}
	end

	def terminate(_reason, _req, _state), do: :ok
end