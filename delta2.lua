_G.discordia = require("discordia")
local client = _G.discordia.Client()
local token = require("../token")
local dcmd = require("delta2cmd")


client:on("ready", function()
	p(string.format("Logged in as %s", client.user.username))
end)

client:on("messageCreate", function(message)
	if message.author == client.user then return end
	if not message.author.id == "184262286058323968" then return end
	local cmd, arg = string.match(message.content, "(%S+)%s+(.*)")
	cmd = cmd or message.content
	if dcmd[cmd] ~= nil then
		dcmd[cmd](message)
	end
end)

client:run(_G.SKUFS_TOKEN)
