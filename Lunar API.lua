local lunar = {}

function lunar.chat(msg)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

function lunar.getexecutor(includelunar)
	if includelunar and includelunar == true then
		local exec = identifyexecutor() or "Unknown"
		return "LunarExecutor // " .. exec
	else
		return identifyexecutor() or "Unknown"
	end
end

function lunar.protectui(ui)
	if syn and syn.protect_gui then
		syn.protect_gui(ui)
		ui.Parent = (gethui and gethui()) or game.CoreGui
		return true
	elseif protect_gui then
		protect_gui(ui)
		ui.Parent = (gethui and gethui()) or game.CoreGui
		return true
	else
		warn("LunarExecutor // The executor that LunarExecutor is being used on does not support protect_gui!")
		ui.Parent = (gethui and gethui()) or game.CoreGui
		return false
	end
end

function lunar.request(requestinfo)
	local req = nil
	
	if syn and syn.request then
		req = syn.request
	elseif http and http.request then
		req = http.request
	elseif http_request then
		req = http_request
	else
		error("LunarExecutor // The executor that LunarExecutor is being used on does not support http requests!")
		return nil
	end
	
	return req(requestinfo)
end

function lunar.kick(msg)
	if msg then
		game.Players.LocalPlayer:Kick(msg)
	else
		game.Players.LocalPlayer:Kick()	
	end
end

function lunar.load(path)
	local file = isfile(path)
	
	if file then
		return readfile(path)
	else
		error("Invalid file - File not found! Make sure the file is in the executor's workspace folder.")
		return nil
	end
end

local chatEvents = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents")
local messageDoneFiltering = chatEvents:WaitForChild("OnMessageDoneFiltering")

lunar.onplayerchatted = messageDoneFiltering.OnClientEvent

local signals = {}

function lunar.createsignal()
	local newsignal = {
		Connections = {},
	}
	
	function newsignal:Fire(...)
		local args = {...}
		
		for i, con in pairs(newsignal.Connections) do
			local success, err = pcall(function()
				con.ConnectedFunction(table.unpack(args))
			end)
			
			if not success and err then
				error(err)
			end
		end
	end
	
	function newsignal:Connect(con)
		local newcon = {
			ConnectedFunction = con,
		}
		
		function newcon:Disconnect()
			table_remove(newsignal.Connections, newcon)
		end
	
		table.insert(newsignal.Connections, newcon)
		
		return newcon
	end
	
	table.insert(signals, newsignal)
	
	return newsignal
end

return lunar
