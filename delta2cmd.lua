local cmd = {}
dofile("libs/xml.lua")
dofile("libs/handler.lua")
local handler = simpleTreeHandler()
local parser = xmlParser(handler)

servers = {
	surf = "178.63.73.69:27017",
	s = "178.63.73.69:27017",
	bigcity = "178.63.73.69:27015",
	bc = "178.63.73.69:27015",
	pokemon = "178.63.73.69:27016",
	pm = "178.63.73.69:27016",
	mariokart = "178.63.73.69:27018",
	mk = "178.63.73.69:27018",
}

sname = {}
sname["178.63.73.69:27015"] = "BigCity"
sname["178.63.73.69:27016"] = "Pokémon"
sname["178.63.73.69:27017"] = "Surf"
sname["178.63.73.69:27018"] = "MarioKart"

id = {
	"BigCity---",
	"Pokémon---",
	"Surf------",
	"MarioKart-"
}


-- cmd["```lua"].cmd = function(message)
-- 	if not message.author.id == "184262286058323968" then return end
-- 	_G.M = message
-- 	local code = message.content:sub(7)
-- 	local code = code:sub(1,-4)
-- 	local fn, err = loadstring(code)
-- 	if fn then
-- 		local str = fn()
-- 		if str then
-- 			message.channel:sendMessage("```"..str.."```")
-- 		end
-- 	else
-- 		message.channel:sendMessage("```"..err.."```")
-- 	end
-- end
--

-- cmd["-"] = {}
-- cmd["-"].cmd = function(message)
-- 	if not message.author.id == "184262286058323968" then return end
-- 	local code = "return "..message.content:sub(3)
-- 	local fn, err = loadstring(code)
-- 	if fn then
-- 		local msg = fn()
-- 		if msg then
-- 			message.channel:sendMessage({embed=msg})
-- 		end
-- 	else
-- 		message.channel:sendMessage("```"..err.."```")
-- 	end
-- 	message:delete()
-- end
--
-- cmd.list = {
-- 	cmd = function(message)
-- 	end,
-- 	cd = 20,
-- }

cmd.servers = {
	cmd = function(message)
		local res, data = _G.http.request("GET", "http://stats.skufs.net/api/serverlist/country/se")
		handler = simpleTreeHandler()
		parser = xmlParser(handler)
		parser:parse(data)
		data = parser._handler.root.gameME
		local sstr = ""
		for k, v in pairs(data.serverlist.server) do
			sstr=sstr.."`"..id[tonumber(v.id)]..": "..v.act.."/"..v.max.."` [Click to join](steam://connect/"..v.addr..":"..v.port..")\n"
		end
		if not message.channel.isPrivate then
			message:delete()
		end
		return message:reply({embed={
			title="Serverlist",
			color="16711680",
			description=sstr,
		}})
	end,
	cd = 20
}


return cmd
