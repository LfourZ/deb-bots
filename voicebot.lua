local discordia = require("discordia")
local client = discordia.Client()
client.voice:loadOpus('libopus-x64')
client.voice:loadSodium('libsodium-x64')
local token = require("../token")


client:on("ready", function()
	p(string.format("Logged in as %s", client.user.username))
end)

client:on("messageCreate", function(message)
	if message.author == client.user then return end
	local cmd, arg = string.match(message.content, "(%S+) (.*)")
	cmd = cmd or message.content
end)

client:run(_G.SPOOKY_TOKEN)
