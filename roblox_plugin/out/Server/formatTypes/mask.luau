--!native
-- Compiled with roblox-ts v3.0.0
local TS = require(script.Parent.Parent.Parent.include.RuntimeLib)
local SendMessagesThread = TS.import(script, script.Parent.Parent, "sendMessages").default
local ReceiveMessagesThread = TS.import(script, script.Parent.Parent, "receiveMessages").default
local function read(receiveThread, args, formatData, masks)
	local mask = formatData.mask
	local condition = not not masks[mask]
	if formatData.invert ~= nil and formatData.invert then
		condition = not condition
	end
	if condition then
		ReceiveMessagesThread.parse(receiveThread, args, formatData.data, masks)
	end
end
local function write(sendThread, args, argsCount, formatData, masks)
	local mask = formatData.mask
	local condition = not not masks[mask]
	if formatData.invert ~= nil and formatData.invert then
		condition = not condition
	end
	if condition then
		argsCount = SendMessagesThread.parse(sendThread, args, argsCount, formatData.data, masks)
	end
	return argsCount
end
return {
	read = read,
	write = write,
}
