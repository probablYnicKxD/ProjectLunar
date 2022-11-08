--[[

  LunarHub is releasing soon!

]]--

game.Players.LocalPlayer.OsPlatform = "LunarHub"

local LunarHub = game:GetObjects("rbxassetid://0")[1]

--[[ Utility Functions ]]--

local function notifyUser(msg, success)
	if success == nil then
		
	end
	
	if success == true then
		
	end
	
	if success == false then
		
	end
end

local function rejoin()
	if #game.Players:GetPlayers() <= 1 then
		notifyUser("Rejoining...", true)
		game.Players.LocalPlayer:Kick("\nLunarHub - Rejoining...")
		wait()
		game:GetService('TeleportService'):Teleport(game.PlaceId, game.Players.LocalPlayer)
	else
		notifyUser("Rejoining...", true)
		game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
	end
end

local function selfreset()
	local char = game.Players.LocalPlayer.Character
	
	if char then
		local humanoid = char:FindFirstChild("Humanoid")
		
		if humanoid then
			humanoid.Health = 0
			notifyUser("Successfully reset!", true)
		else
			notifyUser("Humanoid not found!", false)
			return
		end
	else
		notifyUser("Character not found!", false)
		return
	end
end

local function getlunarusers()
	local usingLunarTable = {}
	
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr.OsPlatform == "LunarHub" then
			table.insert(usingLunarTable, plr)
		end
	end
	
	return usingLunarTable
end

--[[ Executor Detection ]]--

local UserExecutor = identifyexecutor() or "Unknown"

if syn then
	UserExecutor = "Synapse X"
end

notifyUser("Detected executor: " .. UserExecutor)

--[[ Configurations ]]--

local ConfigFolderName = "LunarHub Configurations"
local CustomFolderName = "LunarHub Custom Scripts"
local ConfigFileName = "LunarHub_Configs"

local firstTime = false

local LunarHubSettings = {
	Theme = "Dark",
	TaskbarKeybind = Enum.KeyCode.E
}

--Protection--

if gethui then
	LunarHub.Parent = gethui()
elseif syn.protect_gui then
	syn.protect_gui(LunarHub)
	LunarHub.Parent = game:GetService("CoreGui")
else
	LunarHub.Parent = game:GetService("CoreGui")
end

--Configuration Saving--

local function checkFunctions()
	if isfile and delfile and writefile and readfile and listfiles and makefolder and isfolder then
		return true
	else
		warn("LunarHub // Your executor does not support the necessary file functions for configuration saving! Configurations, settings, and custom scripts will NOT be saved.")
	end
end

local CustomFolder = isfolder(CustomFolderName)
local ConfigFolder = isfolder(ConfigFolderName)

local CustomScripts = {}

local function loadConfiguration()
	for i, file in ipairs(listfiles(ConfigFolderName)) do
		local configFile = game:GetService("HttpService"):JSONDecode(readfile(file))
	
		LunarHubSettings = {
			Theme = configFile.Theme,
			TaskbarKeybind = configFile.TaskbarKeybind
		}
	end
end

local function loadcustomscripts()
	for i, file in ipairs(listfiles(CustomFolderName)) do
		local customScript = game:GetService("HttpService"):JSONDecode(readfile(file))
		local customTable = {
			Name = customScript.Name,
			Description =  customScript.Description,
			Games = customScript.Games,
			LoadstringScript = customScript.LoadstringScript,
		}
		CustomScripts = {}
		table.insert(CustomScripts,customTable)
	end
end

local function makecustomscript(name, desc, games, script)
	local _folder = CustomFolder
	
	if _folder then
		local newTable = {
			Name = name,
			Description = desc,
			Games = games,
			LoadstringScript = script
		}
		
		local httpService = game:GetService("HttpService")
		
		local newScript = writefile(CustomFolderName .. "/" .. name .. ".lua", )
	end
end

if checkFunctions() == true then
	if isfolder(CustomFolderName) then
		loadcustomscripts()
		firstTime = false
	else
		CustomFolder = makefolder(CustomFolderName)
		firstTime = true
	end
	
	if isfolder(ConfigFolderName) then
		loadConfiguration()
		firstTime = false
	else
		ConfigFolder = makefolder(ConfigFolderName)
	end
end

local function writesettings()
	local newfile = writefile("")
end

--[[ Playerlist System ]]--

local Players = game.Players:GetPlayers()

for i, player in pairs(Players) do
	if player.OsPlatform == "LunarHub" then
		local new = Instance.new("BoolValue", player)
		new.Name = "UsingLunar"
		new.Value = true
	end
end

local function updatePlayerList()
	local newPlayerList = game.Players:GetPlayers()
	
	for i, player in pairs(newPlayerList) do
		if player.OsPlatform == "LunarHub" then
			local already = player:FindFirstChild("UsingLunar")
			
			if already then already:Destroy() end
			
			local new = Instance.new("BoolValue", player)
			new.Name = "UsingLunar"
			new.Value = true
		end
	end
	
	return newPlayerList
end

game.Players.PlayerAdded:Connect(function()
	Players = updatePlayerList()
end)

game.Players.PlayerRemoving:Connect(function()
	Players = updatePlayerList()	
end)

local playerlistUI = LunarHub._
