local cmd = {}
local slaxml = require("slaxdom")
local xml = slaxml:parser()

cmd["xml"] = function(message)
	local cmd2, arg2 = string.match(message.content, "(%S+)%s+(.*)")
	cmd2 = cmd2 or message.content
	local doc = slaxml:dom(arg2,{simple=true})


	p(doc.root)
end

cmd["```lua"] = function(message)
	_G.M = message
	local code = message.content:sub(7)
	local code = code:sub(1,-4)
	local fn, err = loadstring(code)
	if fn then
		local str = fn()
		if str then
			message.channel:sendMessage("```"..str.."```")
		end
	else
		message.channel:sendMessage("```"..err.."```")
	end
end

return cmd
