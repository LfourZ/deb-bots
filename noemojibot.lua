local discordia = require("discordia")
local client = discordia.Client()
local token = require("../token")
local blacklist = {
	"😂",
	"😄",
}

client:on("ready", function()
	p(string.format("Logged in as %s", client.user.username))
end)

client:on("messageCreate", function(message)
	if message.author == client.user then return end
	if message.author.id == message.guild.owner.id then return end
	print(message.content)
	for i = 1, #blacklist do
		if string.match(message.content, blacklist[i]) then
			message:delete()
			message.author:sendMessage("fuckoff tyvm")
			break
		end
	end
end)

client:run(_G.SPOOKY_TOKEN)
