_G.discordia = require("discordia")
local client = _G.discordia.Client()
local token = require("../token")
local timer = require("timer")
_G.http = require("coro-http")
_G.dcmd = require("delta2cmd")
_G.c = _G.discordia.Color
prefix = "!"
cd = {}

client:on("ready", function()
	p(string.format("Logged in as %s", client.user.username))
end)

client:on("messageCreate", function(message)
	if message.author == client.user then return end
	local cmd, arg = string.match(message.content, "(%S+)%s+(.*)")
	cmd = cmd or message.content
	if message.content:sub(1,1) ~= prefix then return end
	cmd = cmd:sub(2)
	if not _G.dcmd[cmd] then return end
	if _G.dcmd[cmd].cmd ~= nil then
		if not cd[message.guild.id] then cd[message.guild.id] = {} end
		if not cd[message.guild.id][cmd] then cd[message.guild.id][cmd] = 0 end
		if cd[message.guild.id][cmd] > os.time() then return end
		if _G.dcmd[cmd].cd then cd[message.guild.id][cmd] = os.time() + _G.dcmd[cmd].cd end
		local sentMsg = _G.dcmd[cmd].cmd(message)
		if sentMsg and _G.dcmd[cmd].cd then
			timer.setTimeout(_G.dcmd[cmd].cd * 1000, coroutine.wrap(sentMsg.delete), sentMsg)
		end
	end
end)

client:run(_G.SKUFS_TOKEN)
