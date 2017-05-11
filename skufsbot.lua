local discordia = require("discordia")
local client = discordia.Client()
local token = require("../token")
local http = require("coro-http")

local xml = xmlParser(simpleTreeHandler())

client:on("ready", function()
	p(string.format("Logged in as %s", client.user.username))
end)

client:on("messageCreate", function(message)
	if message.author == client.user then return end
	local cmd, arg = string.match(message.content, "(%S+) (.*)")
	cmd = cmd or message.content
	if cmd == "test" then
		local res, data = http.request("GET", "http://stats.skufs.net/api/serverinfo/178.63.73.69:27017")
		data = xml:parse(data)
		local str = ""
		for k, v in pairs(data) do
			str = str..tostring(k).."  "..tostring(v).."\n"
		end
		message.channel:sendMessage(strx)
	end
end)

client:run(_G.SPOOKY_TOKEN)
