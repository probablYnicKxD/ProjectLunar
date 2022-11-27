--[[

  	LunarHub - Version 0.0.5 Alpha
  	
  	open-source because i really don't care if you copy SOME parts of the script, just not all of it.
  	
  	also please give my credit! ty!
  
  	Made by probablYnicK
  
  	UI design inspired by shlexware's design of Sirius and DomainX!

]]--

--[[ Services ]]--

local bootTime = os.time()

warn("LunarHub // LunarHub is starting!")

warn("LunarHub // Getting game data...")

local gt = os.time()

local CurrentGameInfoData = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

warn("LunarHub // Collected game data! MarketplaceService took " .. os.time() - gt .. " seconds to collect data.")

local LunarHubVersion = "v0.0.5 Alpha"

local LunarHubUI_URL = "https://github.com/probablYnicKxD/ProjectLunar/blob/main/LunarHub/LunarHub%20Interface%20-%20" .. LunarHubVersion .. ".rbxm?raw=true"

local UserExecutor = identifyexecutor() or "Unknown"

if not isfile and delfile and writefile and readfile and listfiles and makefolder and isfolder and setclipboard and (getsynasset or getcustomasset) then
	warn("LunarHub // " .. UserExecutor .. " is not supported! Please get another executor, or use the recommended executor, Comet 3.")

	local new = Instance.new("Message", game.Workspace)
	new.Text = "LunarHub // " .. UserExecutor .. " is not supported. Please get another executor, or use the recommended executor, Comet 3."

	wait(5)

	new:Destroy()

	return
end

--credits to RegularVynixiu for this asset loading stuff lol

local GetAsset = getsynasset or getcustomasset

local function LoadCustomInstance(url)
	if url == "" then
		return ""
	elseif string.find(url, "rbxassetid://") or string.find(url, "roblox.com") or tonumber(url) then
		local numberId = string.gsub(url, "%D", "")
		return game:GetObjects("rbxassetid://".. numberId)[1]
	else
		local fileName = "customInstance_".. tick().. ".txt"
		local instance = nil
		writefile(fileName, game:HttpGet(url))
		instance = game:GetObjects(GetAsset(fileName))[1]
		delfile(fileName)

		return instance
	end
end

local function strtokeycode(str)
	return Enum.KeyCode[string.sub(str, 14)]
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
	if msg ~= "lunar:Destroy()" then return end

	if game.CoreGui:FindFirstChild("ProjectLunar - LunarHub") then
		game.CoreGui["ProjectLunar - LunarHub"]:Destroy()
		local cam = game.Workspace.CurrentCamera or game.Workspace.Camera or game.Workspace:FindFirstChildWhichIsA("Camera")

		if cam then cam.FieldOfView = 70 end

		local blur = game.Lighting:FindFirstChild("ProjectLunarBlur")

		if blur then blur:Destroy() end

		warn("LunarHub // Destroyed interface.")
	end
end)

if game.CoreGui:FindFirstChild("ProjectLunar - LunarHub") then
	game.CoreGui["ProjectLunar - LunarHub"]:Destroy()
	local cam = game.Workspace.CurrentCamera or game.Workspace.Camera or game.Workspace:FindFirstChildWhichIsA("Camera")

	if cam then cam.FieldOfView = 70 end

	local blur = game.Lighting:FindFirstChild("ProjectLunarBlur")

	if blur then blur:Destroy() end

	warn("LunarHub // LunarHub automatically destroyed another instance of the interface!")
end

warn("LunarHub // Loading UI...")

local utime = os.time()

local LunarHub = LoadCustomInstance(LunarHubUI_URL)

--[[ yielding so that no errors mid-script, this will change if i find a different way to do this ]]--

local yield = LunarHub:WaitForChild("Home"):WaitForChild("Interactions"):WaitForChild("Server"):WaitForChild("Players")
local second_Yield = LunarHub:WaitForChild("Playerlist"):WaitForChild("Interactions"):WaitForChild("List"):WaitForChild("Template"):WaitForChild("Interactions"):WaitForChild("Teleport"):WaitForChild("Shadow"):WaitForChild("UICorner")

repeat warn("LunarHub // Waiting for UI elements to load..."); wait(1) until LunarHub.Home and LunarHub.ProjectLunarBlur and LunarHub.Notifications and LunarHub.GameDetection and LunarHub.Playerlist and LunarHub.ScriptSearch and LunarHub.Scripts and LunarHub.Settings and LunarHub.Taskbar and LunarHub.Theme and LunarHub.ThemeImport and LunarHub.LunarLogo and LunarHub.QuickPlay and LunarHub.JoinCodes and LunarHub.DarkBG and LunarHub.Character and LunarHub.KeystrokesUI and LunarHub.SaveFile and LunarHub.OpenFile

warn("LunarHub // UI loaded in " .. os.time() - utime .. " seconds")

local LocalPlayer = game.Players.LocalPlayer

if not game:IsLoaded() then
	repeat warn("LunarHub // Waiting for game to load..."); wait(2); until game:IsLoaded()
end

if not LocalPlayer then
	repeat warn("LunarHub // Waiting for player..."); wait(1) until game.Players.LocalPlayer
	wait(1)
end

local OriginalCharacterProperties = {
	WalkSpeed = LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed,
	JumpPower = LocalPlayer.Character:WaitForChild("Humanoid").JumpPower,
	FieldOfView = game.Workspace.CurrentCamera.FieldOfView or game.Workspace.Camera.FieldOfView or game.Workspace:FindFirstChildWhichIsA("Camera").FieldOfView
}

local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local RS = game:GetService("ReplicatedStorage")

local latest = loadstring(game:HttpGet("https://raw.githubusercontent.com/probablYnicKxD/ProjectLunar/main/LunarHub/latestversion.lua"))()

local req = nil

if syn and syn.request then
	req = syn.request
elseif http and http.request then
	req = http.request
elseif http_request then
	req = http_request
else
	req = nil
end

local NormalTweenInfo = TweenInfo.new(
	0.75,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local SecondaryTweenInfo = TweenInfo.new(
	0.75,
	Enum.EasingStyle.Exponential,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local LongTweenInfo = TweenInfo.new(
	3.25,
	Enum.EasingStyle.Exponential,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local LunarHubSettings = {
	Theme = "DARK",
	TaskbarKeybind = Enum.KeyCode.E,
	HomeKeybind = Enum.KeyCode.H,
	TimeFormat = 12,
	ShowSeconds = false,
}

local LunarHubThemes = {
	DARK = {
		Home = Color3.fromRGB(0, 0, 0),
		GameDetection = Color3.fromRGB(15, 15, 15),
		ScriptSearch = Color3.fromRGB(20, 20, 20),
		Taskbar = Color3.fromRGB(255, 255, 255),
		Settings = Color3.fromRGB(25, 25, 25),
		Scripts = Color3.fromRGB(255, 255, 255),
		Theme = Color3.fromRGB(255, 255, 255),
		ThemeImport = Color3.fromRGB(255, 255, 255),
		Notifications = Color3.fromRGB(255, 255, 255),
		ServerList = Color3.fromRGB(20, 20, 20),
		LunarLogo = Color3.fromRGB(255, 255, 255),
	},
	LIGHT = {},
	WAVE = {},
	LUNAR = {},
	SOLAR = {},
	DISCORD = {},
	ECLIPSE = {}
}

--[[ Other ]]--

local function getStatus(id)
	local owner = 1038671897

	local prealphatester = 2200660682

	if id == owner then
		return "Project Lunar Developer"
	end

	if id == prealphatester then
		return "Project Lunar Pre-Alpha Tester"
	elseif game.Players:GetPlayerByUserId(id) and game.Players:GetPlayerByUserId(id).OsPlatform == "LunarHub" then
		return "Project Lunar User"
	else
		return "Non-Project Lunar User"
	end
end

local function getGameName()
	return CurrentGameInfoData.Name
end

game.Players.LocalPlayer.OsPlatform = "LunarHub"

--[[ UIs ]]--

local Blur = LunarHub:WaitForChild("ProjectLunarBlur")
local NotificationUI = LunarHub:WaitForChild("Notifications")
local GameDetectionUI = LunarHub.GameDetection
local HomeUI = LunarHub.Home
local PlayerlistUI = LunarHub.Playerlist
local ScriptLibraryUI = LunarHub.ScriptSearch
local ScriptsUI = LunarHub.Scripts
local SettingsUI = LunarHub.Settings
local TaskbarUI = LunarHub.Taskbar
local ThemeUI = LunarHub.Theme
local ThemeImportUI = LunarHub.ThemeImport

local LunarLogo = LunarHub.LunarLogo

local OpenTaskbarOnClose = true

local scriptsOpen = false
local taskbarOpen = false

local function activateBlur()
	local blur = LunarHub:FindFirstChild("ProjectLunarBlur") or game:GetService("Lighting"):FindFirstChild("ProjectLunarBlur")

	blur.Parent = game:GetService("Lighting")
	blur.Enabled = true

	local activation = TS:Create(blur, SecondaryTweenInfo, {Size = 10})
	activation:Play()
	activation.Completed:Wait()
end

local function deactivateBlur()
	local blur = LunarHub:FindFirstChild("ProjectLunarBlur") or game:GetService("Lighting"):FindFirstChild("ProjectLunarBlur")

	blur.Parent = game:GetService("Lighting")

	local deactivation = TS:Create(blur, SecondaryTweenInfo, {Size = 0})
	deactivation:Play()
	deactivation.Completed:Wait()

	blur.Enabled = false
end

local function camZoomIn()
	local cam = game.Workspace.CurrentCamera or game.Workspace.Camera or game.Workspace:FindFirstChildWhichIsA("Camera")

	if cam then
		TS:Create(cam, SecondaryTweenInfo, {FieldOfView = 40}):Play()
	end
end

local function camZoomOut()
	local cam = game.Workspace.CurrentCamera or game.Workspace.Camera or game.Workspace:FindFirstChildWhichIsA("Camera")

	if cam then
		TS:Create(cam, SecondaryTweenInfo, {FieldOfView = 70}):Play()
	end
end

local function inBlur()
	task.spawn(function()
		activateBlur()
	end)

	task.spawn(function()
		camZoomIn()
	end)
end

local function outDeBlur()
	task.spawn(function()
		deactivateBlur()
	end)

	task.spawn(function()
		camZoomOut()
	end)
end

local function openHome()
	if LunarHub:WaitForChild("Scripts").Position == UDim2.new(0.5,0,1,-90) then
		scriptsOpen = true
	else
		scriptsOpen = false
	end

	if LunarHub.Taskbar.Position == UDim2.new(0.5,0,1,-12) then
		taskbarOpen = true
	else
		taskbarOpen = false
	end

	TS:Create(LunarHub.Scripts, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.6,-90)}):Play()
	TS:Create(LunarHub.Taskbar, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.2,-12)}):Play()

	TS:Create(LunarHub.DarkBG, SecondaryTweenInfo, {BackgroundTransparency = 0.7}):Play()
	TS:Create(HomeUI, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,0.5,0)}):Play()

	inBlur()
end

local function closeHome()
	if scriptsOpen then
		TS:Create(LunarHub.Scripts, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1,-90)}):Play()
	end

	if taskbarOpen or OpenTaskbarOnClose then
		TS:Create(LunarHub:WaitForChild("Taskbar", 20), SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1,-12)}):Play()
		OpenTaskbarOnClose = false
	end

	TS:Create(LunarHub.DarkBG, SecondaryTweenInfo, {BackgroundTransparency = 1}):Play()
	TS:Create(HomeUI, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,-0.5,0)}):Play()

	outDeBlur()
end

local function toggleHome()
	if HomeUI.Position == UDim2.new(0.5,0,0.5,0) then
		closeHome()
	else
		openHome()
	end
end

local lltween = TS:Create(LunarLogo, LongTweenInfo, {ImageTransparency = 0})
lltween:Play()
lltween.Completed:Wait()

wait(1)

local lltween2 = TS:Create(LunarLogo, LongTweenInfo, {ImageColor3 = Color3.fromRGB(0,0,0)})
lltween2:Play()
lltween2.Completed:Wait()

wait(1)

local lltween3 = TS:Create(LunarLogo, LongTweenInfo, {ImageTransparency = 0.7, Size = UDim2.new(10,0,10,0)})
lltween3:Play()

openHome()

local notiTable = {}

--[[ Utility Functions ]]--

local function notifyUser(msg, success, notiTime)
	task.spawn(function()
		local template = NotificationUI:WaitForChild("Template")

		local new = template:Clone()

		local notiOpen = Instance.new("BoolValue", new)
		notiOpen.Name = "NotiOpen"
		notiOpen.Value = true

		local interact = Instance.new("TextButton", new)

		new.Name = "Notification"
		new.Parent = NotificationUI
		new.NotificationText.Text = msg
		new.NotificationText.TextTransparency = 1
		new.BackgroundTransparency = 1

		interact.BackgroundTransparency = 1
		interact.Text = ""
		interact.TextSize = 1
		interact.Position = UDim2.new(0,0,0,0)
		interact.Size = UDim2.new(1,0,1,0)

		if success == nil then
			new.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 221, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 160, 180))})
		end

		if success == true then
			new.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 200, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 0))})
		end

		if success == false then
			new.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(209, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(113, 0, 0))})
		end

		new.Visible = true

		table.insert(notiTable, new)

		TS:Create(new, SecondaryTweenInfo, {BackgroundTransparency = 0}):Play()

		local notiTween_first = TS:Create(new.NotificationText, NormalTweenInfo, {TextTransparency = 0})
		notiTween_first:Play()
		notiTween_first.Completed:Wait()

		local notificationTime = notiTime or 7.5

		interact.MouseButton1Click:Connect(function()
			if notiOpen.Value == true then
				if new then
					notiOpen.Value = false

					task.spawn(function()
						TS:Create(new, NormalTweenInfo, {BackgroundTransparency = 1}):Play()
						local notiTween = TS:Create(new.NotificationText, NormalTweenInfo, {TextTransparency = 1})
						notiTween:Play()
						notiTween.Completed:Wait()

						new:Destroy()
					end)
				end
			end
		end)

		wait(notificationTime)

		if notiOpen == false then return end

		notiOpen.Value = false
		TS:Create(new, NormalTweenInfo, {BackgroundTransparency = 1}):Play()
		local notiTween = TS:Create(new.NotificationText, NormalTweenInfo, {TextTransparency = 1})
		notiTween:Play()
		notiTween.Completed:Wait()

		new:Destroy()
	end)

	wait()
end

UIS.InputBegan:Connect(function(input)
	if input.KeyCode ~= Enum.KeyCode.V then return end

	for i, noti in pairs(notiTable) do
		local notiOpen = noti:FindFirstChild("NotiOpen")

		if notiOpen and notiOpen.Value == true then
			if noti then
				notiOpen.Value = false

				task.spawn(function()
					TS:Create(noti, NormalTweenInfo, {BackgroundTransparency = 1}):Play()
					local notiTween = TS:Create(noti.NotificationText, NormalTweenInfo, {TextTransparency = 1})
					notiTween:Play()
					notiTween.Completed:Wait()

					noti:Destroy()
				end)
			end
		end
	end
end)

notifyUser("Welcome to LunarHub " .. LunarHubVersion .. ", " .. game.Players.LocalPlayer.DisplayName .. "!")

if LunarHubVersion ~= latest then
	notifyUser("There is a newer version of LunarHub available! Please use the newest release to ensure the best quality script hub.", false)
end

notifyUser("Please wait while we attempt to load your settings for you.")

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

if syn then
	UserExecutor = "Synapse X"
end

if UserExecutor == "Unknown" then
	if _G.LunarHubDebugMode == true then notifyUser("Detected executor: " .. UserExecutor, false) end
else
	if _G.LunarHubDebugMode == true then notifyUser("Detected executor: " .. UserExecutor, true) end
end

--[[ Configurations ]]--

local ConfigFolderName = "LunarHub Configurations"
local CustomFolderName = "LunarHub Custom Scripts"
local ThemesFolderName = "LunarHub Themes"
local ConfigFileName = "LunarHub_Configs"
local ThemesFileName = "LunarHub_Themes"

local firstTime = false

--Protection--

if syn and syn.protect_gui then
	syn.protect_gui(LunarHub)
	LunarHub.Parent = game:GetService("CoreGui")
	notifyUser("LunarHub is being protected by " .. UserExecutor, true)
elseif protect_gui then
	protect_gui(LunarHub)
	LunarHub.Parent = game:GetService("CoreGui")
	notifyUser("LunarHub is being protected by " .. UserExecutor, true)
elseif gethui then
	LunarHub.Parent = gethui()
else
	LunarHub.Parent = game:GetService("CoreGui")
end

--Configuration Saving--

local function checkFunctions()
	if isfile and delfile and writefile and readfile and listfiles and makefolder and isfolder then
		return true
	else
		notifyUser("Your executor does not support the necessary file functions for configuration saving! Configurations, settings, and custom scripts will NOT be saved.", false)
	end
end

local CustomFolder = isfolder(CustomFolderName)
local ConfigFolder = isfolder(ConfigFolderName)

local CustomScripts = {}

local https = game:GetService("HttpService")

local function loadConfiguration()
	notifyUser("Loading settings...", true)
	for i, file in pairs(listfiles(ConfigFolderName)) do
		local configFile = https:JSONDecode(readfile(file))

		LunarHubSettings = {
			Theme = configFile.Theme,
			TaskbarKeybind = strtokeycode(configFile.TaskbarKeybind),
			HomeKeybind = strtokeycode(configFile.HomeKeybind),
			TimeFormat = configFile.TimeFormat,
			ShowSeconds = configFile.ShowSeconds,
		}

		local set = SettingsUI.Settings

		local function toggleToColor(b)
			if b == true then
				return Color3.fromRGB(170, 0, 0)
			else
				return Color3.fromRGB(0, 255, 127)
			end
		end

		local function numToToggle(n)
			if n == 12 then
				return false
			else
				return true
			end
		end

		set.HomeKeybind.KeybindFrame.CurrentBind.Text = string.sub(configFile.HomeKeybind, 14)
		set.TaskbarKeybind.KeybindFrame.CurrentBind.Text = string.sub(configFile.TaskbarKeybind, 14)
		set.TimeToggle.Icon.ImageColor3 = toggleToColor(numToToggle(configFile.TimeFormat))
		set.SecondsToggle.Icon.ImageColor3 = toggleToColor(configFile.ShowSeconds)
	end
	notifyUser("Successfully loaded settings!", true)
end

local function loadcustomscripts(nonoti)
	if not nonoti then
		notifyUser("Loading custom scripts...", true)
	end
	CustomScripts = {}
	for i, file in pairs(listfiles(CustomFolderName)) do
		local customScript = https:JSONDecode(readfile(file))
		local customTable = {
			Name = customScript.Name,
			Description =  customScript.Description,
			Games = customScript.Games,
			LoadstringScript = customScript.LoadstringScript,
		}
		table.insert(CustomScripts,customTable)
	end
	if not nonoti then
		notifyUser("Successfully loaded your custom scripts!", true)
	end
end

local function savecustomscripts()
	if checkFunctions() == false then notifyUser("Failed to save custom scripts // Your executor does not support file saving!", false) return end

	for i, customScr in pairs(CustomScripts) do
		customScr = https:JSONEncode(customScr)

		local newFile = writefile(CustomFolderName .. "/" .. customScr.Name .. ".txt", customScr)
	end

	notifyUser("Successfully saved custom scripts!", true)
end

if checkFunctions() == true then
	if isfolder(CustomFolderName) then
		loadcustomscripts()
		firstTime = true
	else
		if firstTime ~= true then
			notifyUser("We have detected that you do not have saved settings and have calculated that this is your first time using LunarHub!", true)
			notifyUser("Please wait while we create files for you.")
		end
		CustomFolder = makefolder(CustomFolderName)
		firstTime = true
	end

	if isfolder(ConfigFolderName) then
		loadConfiguration()
		firstTime = true
	else
		if firstTime ~= true then
			notifyUser("We have detected that you do not have saved settings and have calculated that this is your first time using LunarHub!", true)
			notifyUser("Please wait while we create files for you.")
		end
		ConfigFolder = makefolder(ConfigFolderName)
		firstTime = true
	end
else
	notifyUser("Aw, man! We failed to load your settings and custom scripts! Your executor may not support file saving.", false)
end

local function writesettings(newSettings)
	if not checkFunctions() then return end

	newSettings = https:JSONEncode(newSettings)

	local success, errMsg = pcall(function()
		writefile(ConfigFolderName .. "/" .. ConfigFileName .. ".txt", newSettings)
	end)

	LunarHub.Taskbar.FirstTime.Visible = true
	HomeUI.FirstTime.Visible = true
	LunarHub.Taskbar.FirstTime.Text = "TAP '" .. string.sub(tostring(LunarHubSettings.TaskbarKeybind), 14) .. "' TO OPEN/CLOSE"
	LunarHub.Taskbar.FirstTime.TextColor3 = Color3.fromRGB(200,200,200)
	HomeUI.FirstTime.Text = "TAP '" .. string.sub(tostring(LunarHubSettings.HomeKeybind), 14) .. "' TO OPEN/CLOSE"
	HomeUI.FirstTime.TextColor3 = Color3.fromRGB(225,225,225)
	HomeUI.FirstTime.AnchorPoint = Vector2.new(0.5,0)
	HomeUI.FirstTime.Position = UDim2.new(0.5,0,HomeUI.FirstTime.Position.Y.Scale, HomeUI.FirstTime.Position.Y.Offset)
	HomeUI.FirstTime.TextXAlignment = Enum.TextXAlignment.Center

	if success then
		notifyUser("Successfully saved settings!", true)
	elseif not success and errMsg then
		notifyUser("Failed to save settings! Error message shown in Developer Console. [F9]", false)
	end
end

local function createTheme(name, main, accent, secondary, text)
	if checkFunctions() == false then return end

	local success,errMsg = pcall(function()
		LunarHubThemes[name] = {
			Main = main,
			Accent = accent,
			Secondary = secondary,
			Text = text
		}
	end)

	if success then
		notifyUser("Successfully created theme " .. name .. "!", true)
	elseif not success and errMsg then
		notifyUser("Failed to create theme - Error message shown in Developer Console! [F9]", false)
		warn("LunarHub // Failed to create theme - Error Message:\n" .. errMsg)
	end
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

local function updatePlayerListTable()
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
	Players = updatePlayerListTable()
end)

game.Players.PlayerRemoving:Connect(function()
	Players = updatePlayerListTable()	
end)

local list = PlayerlistUI.Interactions:WaitForChild("List")

local function refreshPlayerList()
	for i, already in pairs(list:GetChildren()) do
		if already.Name ~= "UIListLayout" and already.Name ~= "Placeholder" and already.Name ~= "Template" then
			already:Destroy()
		end
	end

	local template = list:WaitForChild("Template")

	for i, plr in pairs(Players) do
		local new = template:Clone()

		new.Name = plr.UserId
		new.DisplayName.Text = plr.DisplayName
		new.Username.Text = "@" .. plr.Name
		new.Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(plr.UserId) .. "&w=420&h=420"
		new.Parent = list
		new.Visible = true

		if plr:FindFirstChild("UsingLunar") then
			if plr:WaitForChild("UsingLunar").Value == true then
				new.UsingLunar.Visible = true
			end
		end

		if game.Players.LocalPlayer:IsFriendsWith(plr.UserId) then
			new:WaitForChild("IsFriend").Visible = true
		else
			new:WaitForChild("IsFriend").Visible = false
		end

		new.Interactions.Locate.Interact.MouseButton1Click:Connect(function()
			local newHighlight = Instance.new("Highlight")

			if plr.Character then
				newHighlight.Parent = plr.Character

				newHighlight.Archivable = true
				newHighlight.Adornee = plr.Character
				newHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				newHighlight.Enabled = true
				newHighlight.FillColor = Color3.fromRGB(170, 221, 255)
				newHighlight.FillTransparency = 0
				newHighlight.Name = "LunarHubLocator"
				newHighlight.OutlineColor = Color3.fromRGB(0,0,0)
				newHighlight.OutlineTransparency = 0

				notifyUser("Successfully highlighted " .. plr.DisplayName .. "! Highlight will be removed in 15 seconds.", true)

				wait(15)

				newHighlight:Destroy()

				notifyUser("Highlight removed.", true)
			else
				notifyUser("Failed to locate user - Character not found!", false)
			end
		end)

		new.Interactions.Teleport.Interact.MouseButton1Click:Connect(function()
			local char = game.Players.LocalPlayer.Character

			if char then
				local otherChar = plr.Character

				if otherChar then
					local success = pcall(function()
						char.HumanoidRootPart.CFrame = otherChar.HumanoidRootPart.CFrame
					end)

					if success then
						notifyUser("Successfully teleported you to " .. plr.DisplayName .. "!", true)
					else
						notifyUser("Whoops! Something went wrong. Please try again later.", false)
					end
				else
					notifyUser("Failed to teleport - Could not get other player's character!", false)
				end
			else
				notifyUser("Failed to teleport - Could not get your character!", false)
			end
		end)

		new.Interactions.Spectate.Interact.MouseButton1Click:Connect(function()
			local cam = game.Workspace.CurrentCamera or game.Workspace.Camera or game.Workspace:FindFirstChildWhichIsA("Camera")

			if cam then
				cam.CameraSubject = plr.Character

				LunarHub.CurrentlySpectating.Visible = true
				LunarHub.CurrentlySpectating.PlayerName.Text = plr.DisplayName

				LunarHub.CurrentlySpectating.StopSpectating.MouseButton1Click:Connect(function()
					local char = game.Players.LocalPlayer.Character

					if char then
						cam.CameraSubject = char
						LunarHub.CurrentlySpectating.Visible = false
					else
						notifyUser("Failed to stop spectating - Unable to identify character!", false)
					end
				end)
			else
				notifyUser("Failed to spectate - Failed to identify the current camera!", false)
			end
		end)
	end
end

game.Players.PlayerAdded:Connect(function()
	wait()
	refreshPlayerList()
end)

game.Players.PlayerRemoving:Connect(function()
	wait()
	refreshPlayerList()
end)

--[[ FPS COUNTER ]]--

local fpsCounter = HomeUI.FPS

--spawn at bottom of code

--[[ HOME ]]--

local inter = HomeUI.Interactions
local serverInfo = inter.Server

inter.GitHub.Button.Interact.MouseButton1Click:Connect(function()
	setclipboard("https://github.com/probablYnicKxD/ProjectLunar")
end)

inter.Discord.Button.Interact.MouseButton1Click:Connect(function()
	setclipboard("https://discord.io/LunarCrocs")
end)

local localPlayer = game.Players.LocalPlayer

inter.Profile.Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. localPlayer.UserId .. "&w=420&h=420"
inter.Profile.DisplayName.Text = localPlayer.DisplayName
inter.Profile.ProjectLunarRank.Text = getStatus(localPlayer.UserId)
inter.Profile.Username.Text = localPlayer.Name

serverInfo.Game.Rejoin.MouseButton1Click:Connect(function()
	rejoin()
end)

serverInfo.Game.Thumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. game.PlaceId .. "&w=768&h=432"
serverInfo.ServerID.Info.Text = tostring(game.JobId)

local lunaruserstable = getlunarusers()

serverInfo:WaitForChild("Players"):WaitForChild("Info").Text = tostring(#game.Players:GetPlayers()) .. "/" .. game.Players.MaxPlayers .. " Players"
serverInfo:WaitForChild("LunarPlayers").Text = tostring(#lunaruserstable) .. " Lunar Users are playing right now"

local function updateServerPlayers()
	lunaruserstable = getlunarusers()

	serverInfo:WaitForChild("Players"):WaitForChild("Info").Text = tostring(#game.Players:GetPlayers()) .. "/" .. game.Players.MaxPlayers .. " Players"
	serverInfo:WaitForChild("LunarPlayers").Text = tostring(#lunaruserstable) .. " Lunar Users are playing right now"
end

game.Players.PlayerAdded:Connect(function(p)
	wait()
	updateServerPlayers()

	--[[ is it a friend? ]]--

	if game.Players.LocalPlayer:IsFriendsWith(p.UserId) then
		notifyUser("Your friend " .. p.DisplayName .. " (@" .. p.Name .. ") has joined the game.", true)
	end
end)

game.Players.PlayerRemoving:Connect(function(p)
	updateServerPlayers()

	--[[ is it a friend? ]]--

	if game.Players.LocalPlayer:IsFriendsWith(p.UserId) then
		notifyUser("Your friend " .. p.DisplayName .. " (@" .. p.Name .. ") has left the game.", false)
	end
end)

--time/date system--

local function getDate()
	local date

	if LunarHubSettings.ShowSeconds == true and LunarHubSettings.TimeFormat == 12 then
		date = os.date("%I:%M:%S %p")
	elseif LunarHubSettings.ShowSeconds == true and LunarHubSettings.TimeFormat == 24 then
		date = os.date("%H:%M:%S %p")
	elseif LunarHubSettings.ShowSeconds == false and LunarHubSettings.TimeFormat == 12 then
		date = os.date("%I:%M %p")
	elseif LunarHubSettings.ShowSeconds == false and LunarHubSettings.TimeFormat == 24 then
		date = os.date("%H:%M %p")
	end

	local hour = tonumber(os.date("%H"))

	local msg = "Welcome"

	if hour == 0 then
		msg = "It's midnight"
	end

	if hour == 1 then
		msg = "It's early"
	end

	if hour == 2 then
		msg = "It's early"
	end

	if hour == 3 then
		msg = "It's the spooky hour"
	end

	if hour == 4 then
		msg = "It's early"
	end

	if hour == 5 then
		msg = "Good morning"
	end

	if hour == 6 then
		msg = "Good morning"
	end

	if hour == 7 then
		msg = "Good morning"
	end

	if hour == 8 then
		msg = "Good morning"
	end

	if hour == 9 then
		msg = "Good morning"
	end

	if hour == 10 then
		msg = "Good morning"
	end

	if hour == 11 then
		msg = "Good day"
	end

	if hour == 12 then
		msg = "Good day"
	end

	if hour == 13 then
		msg = "Good afternoon"
	end

	if hour == 14 then
		msg = "Good afternoon"
	end

	if hour == 15 then
		msg = "Good afternoon"
	end

	if hour == 16 then
		msg = "Good afternoon"
	end

	if hour == 17 then
		msg = "Good afternoon"
	end

	if hour == 18 then
		msg = "Good evening"
	end

	if hour == 19 then
		msg = "Good evening"
	end

	if hour == 20 then
		msg = "Good night"
	end

	if hour == 21 then
		msg = "Good night"
	end

	if hour == 22 then
		msg = "It's late"
	end

	if hour == 23 then
		msg = "It's late"
	end

	if hour == 24 then
		msg = "It's midnight"
	end

	return date,msg,hour
end

local function getTimeSinceBoot(scale)
	local timeSinceBoot = os.time() - bootTime

	if scale == "sec" then
		return timeSinceBoot
	elseif scale == "hour" then
		local timeInMins = math.round(timeSinceBoot / 60)
		local timeInHours = math.round(timeInMins / 60)

		return timeInHours
	else
		local timeInMins = math.round(timeSinceBoot / 60)
		return timeInMins
	end
end

local function msgToSub(hour)
	local msg = ""

	if hour == 0 then
		msg = "why are you awake?"
	end

	if hour == 1 then
		msg = "aren't you tired?"
	end

	if hour == 2 then
		msg = "aren't you tired?"
	end

	if hour == 3 then
		msg = "are you scared?"
	end

	if hour == 4 then
		msg = "why are you playing roblox this early?"
	end

	if hour == 5 then
		msg = "it's a bit early."
	end

	if hour == 6 then
		msg = "did you just wake up?"
	end

	if hour == 7 then
		msg = "did you see the sunrise?"
	end

	if hour == 8 then
		msg = "did you see the sunrise?"
	end

	if hour == 9 then
		msg = "how's the weather?"
	end

	if hour == 10 then
		msg = "have you had breakfast yet?"
	end

	if hour == 11 then
		msg = "it's almost time for lunch!"
	end

	if hour == 12 then
		msg = "what time is it? it's lunchtime!"
	end

	if hour == 13 then
		msg = "have you had lunch yet?"
	end

	if hour == 14 then
		msg = "have you had lunch yet?"
	end

	if hour == 15 then
		msg = "3pm or 3am, which is scarier?"
	end

	if hour == 16 then
		msg = "second spooky hour's over!"
	end

	if hour == 17 then
		msg = "it's almost dinner time!"
	end

	if hour == 18 then
		msg = "it's almost dinner time!"
	end

	if hour == 19 then
		msg = "drumroll please... it's DINNERTIME!"
	end

	if hour == 20 then
		msg = "did you see the sunset?"
	end

	if hour == 21 then
		msg = "it's dark outside!"
	end

	if hour == 22 then
		msg = "how many stars are outside?"
	end

	if hour == 23 then
		msg = "here's a challenge for you: go to bed!"
	end

	if hour == 24 then
		msg = "why are you awake?"
	end

	return msg
end

local timeElapsedUI = inter.TimeElapsed

timeElapsedUI.Subtitle.Text = "You've been playing " .. getGameName() .. " for"

--spawn at bottom of code

HomeUI.Interactions.Information.ExecutorName.Text = UserExecutor
HomeUI.Interactions.Information.Version.Text = LunarHubVersion

if LunarHubVersion ~= latest then
	HomeUI.Interactions.Information.NewerVersionAvailable.Visible = true
end

local function refreshFriendsList()
	for i, already in pairs(HomeUI:WaitForChild("Interactions"):WaitForChild("Friends"):WaitForChild("List"):GetChildren()) do
		if already.Name ~= "UIListLayout" and already.Name ~= "Template" then
			already:Destroy()
		end
	end

	for i, p in pairs(Players) do
		if game.Players.LocalPlayer:IsFriendsWith(p.UserId) then
			local template = HomeUI.Interactions.Friends.List.Template

			local new = template:Clone()

			new.Parent = HomeUI.Interactions.Friends.List
			new.Visible = true
			new.Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. p.UserId .. "&w=420&h=420"
			new.DisplayName.Text = p.DisplayName
			new.ProjectLunarStatus.Text = getStatus(p.UserId)
			new.Username.Text = p.Name
			new.Name = p.Name
		end
	end
end

refreshFriendsList()

game.Players.PlayerAdded:Connect(function()
	refreshFriendsList()
end)

game.Players.PlayerRemoving:Connect(function()
	refreshFriendsList()
end)

--[[ Script list + Searching ]]--

local scriptLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/probablYnicKxD/ProjectLunar/main/LunarHub/ScriptLibrary.lua"))()

local function refreshScriptLibrary()
	local template = LunarHub.ScriptSearch.List.Template

	for i, scr in pairs(LunarHub.ScriptSearch.List:GetChildren()) do
		if scr.Name ~= "UIListLayout" and scr.Name ~= "Template" and scr.Name ~= "Placeholder" then
			scr:Destroy()
		end
	end

	for i, libraryScript in pairs(scriptLibrary) do
		local new = template:Clone()
		new.Parent = LunarHub.ScriptSearch.List
		new.Visible = true
		new.Name = libraryScript.Name
		new.ScriptName.Text = libraryScript.Name
		new.ScriptDescription.Text = libraryScript.Description
		new.ScriptAuthor.Text = "created by " .. libraryScript.Creator

		local scriptTags = new.Tags

		scriptTags.CanvasPosition = Vector2.new(686, 0) --technically makes them visible

		for i, already in pairs(scriptTags:GetChildren()) do
			if already:IsA("Frame") and already.Name ~= "UIListLayout" and already.Name ~= "Placeholder" then
				already.Visible = false
			end
		end

		for i, tag in pairs(libraryScript.Tags) do
			local tagInstance = scriptTags:FindFirstChild(tag)

			if tagInstance then
				tagInstance.Visible = true
			else
				print("Invalid tag: " .. tag)
			end
		end

		if libraryScript.Universal == true then
			new.Universal.Visible = true
			new.LayoutOrder = 999999
		else
			new.Universal.Visible = false
		end

		if libraryScript.KeySys == true then
			new.KeySystem.Visible = true
		else
			new.KeySystem.Visible = false
		end

		new.Execute.MouseButton1Click:Connect(function()
			notifyUser("Attempting to execute " .. libraryScript.Name .. "...", true)
			local success,errMsg = pcall(function()
				loadstring(libraryScript.LoadstringScript)()
			end)

			if success then
				notifyUser("Successfully executed " .. libraryScript.Name .. "!", true)
			elseif not success and errMsg then
				notifyUser("Failed to execute " .. libraryScript.Name .. " - Error message shown in Dev Console [F9]", false)
				warn("LunarHub // Failed to execute " .. libraryScript.Name .. " - Error Message:\n" .. errMsg)
			end
		end)

		if #libraryScript.SupportedGames == 1 then
			new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. libraryScript.SupportedGames[1] .. "&w=150&h=150"
		elseif #libraryScript.SupportedGames >= 2 then
			local gameThumbnail = table.find(libraryScript.SupportedGames, game.PlaceId)

			if gameThumbnail then
				new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. game.PlaceId .. "&w=150&h=150"
			else
				local randomThumbnail = math.random(1,#libraryScript.SupportedGames)

				local randomGameID = libraryScript.SupportedGames[randomThumbnail]

				if randomGameID then
					new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. randomGameID .. "&w=150&h=150"
				end
			end
		elseif #libraryScript.SupportedGames == 0 and libraryScript.Universal == true then
			new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. game.PlaceId .. "&w=768&h=432"
		else
			new.GameThumbnail.Image = ""
		end

		new.Visible = true
	end
end

local function refreshCustomLibrary()
	loadcustomscripts(true)

	if #CustomScripts == 0 then
		LunarHub.CustomScripts.NoCustomScripts.Visible = true
		LunarHub.CustomScripts.NoCustomScriptsDesc.Visible = true
	else
		LunarHub.CustomScripts.NoCustomScripts.Visible = false
		LunarHub.CustomScripts.NoCustomScriptsDesc.Visible = false
	end

	local template = LunarHub.CustomScripts.List.Template

	for i, scr in pairs(LunarHub.CustomScripts.List:GetChildren()) do
		if scr.Name ~= "UIListLayout" and scr.Name ~= "Template" and scr.Name ~= "Placeholder" then
			scr:Destroy()
		end
	end

	for i, customScr in pairs(CustomScripts) do
		local new = template:Clone()
		new.Name = customScr.Name
		new.ScriptName.Text = customScr.Name
		new.ScriptDescription.Text = customScr.Description
		new.ScriptAuthor.Text = "uploaded/created by you!"
		new.Parent = LunarHub.CustomScripts.List
		new.Visible = true

		if customScr.Games == "UNIVERSAL" then
			new.Universal.Visible = true
		end

		new.Execute.UIStroke.Color = Color3.fromRGB(0,255,0)
		new.Execute.BackgroundColor3 = Color3.fromRGB(0,125,0)

		--[[
		
		local newstroke = Instance.new("UIStroke")
		newstroke.Parent = new.Execute
		newstroke.Color = Color3.fromRGB(0,0,0)
		newstroke.Thickness = 1
		
		]]--

		new.Execute.MouseButton1Click:Connect(function()
			local success,errMsg = pcall(function()
				loadstring(customScr.LoadstringScript)()
			end)

			if success then
				notifyUser("Successfully executed " .. customScr.Name .. "!", true)
			elseif not success and errMsg then
				notifyUser("Failed to execute " .. customScr.Name .. " - Error message shown in Dev Console [F9]", false)
				warn("LunarHub // Failed to execute custom script: " .. customScr.Name .. " - Error Message:\n" .. errMsg)
				return
			end
		end)

		if customScr.Games == "UNIVERSAL" then
			new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. game.PlaceId .. "&w=150&h=150"
		elseif type(customScr.Games) == "table" and #customScr.Games == 1 then
			new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. customScr.Games[1] .. "&w=150&h=150"
		elseif type(customScr.Games) == "table" and #customScr.Games >= 2 then
			local gameThumbnail = table.find(customScr.Games, game.PlaceId)

			if gameThumbnail then
				new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. game.PlaceId .. "&w=150&h=150"
			else
				local randomThumbnail = math.random(1,#customScr.Games)

				local randomGameID = customScr.Games[randomThumbnail]

				if randomGameID then
					new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. randomGameID .. "&w=150&h=150"
				end
			end
		end

		new.Visible = true
	end
end

local function detectBestScriptForGame()
	local gameID = game.PlaceId

	local possibleScripts = {}

	local scriptsUniversal = false

	local _script = nil

	for i, scr in pairs(scriptLibrary) do
		if scr.Universal == false and table.find(scr.SupportedGames, gameID) then
			table.insert(possibleScripts, scr)
		end
	end

	if #possibleScripts == 1 then
		return possibleScripts[1]
	elseif #possibleScripts == 0 then
		for i, scr in pairs(scriptLibrary) do
			if scr.Universal == true then
				table.insert(possibleScripts, scr)
				scriptsUniversal = true
			end
		end
	end

	local lockedBestScript
	local bestScript

	for i, scr in pairs(possibleScripts) do
		if table.find(scr.SupportedGames, game.PlaceId) or scr.Universal == true then
			if scr.Tags["PositiveReviews"] and bestScript == nil and not scr.Tags["Patched"] then
				bestScript = scr
			elseif scr.Tags["PositiveReviews"] and bestScript ~= nil and not scr.Tags["Patched"] then
				if scr.Tags["VerifiedScript"] or scr.Tags["VerifiedCreator"] then
					bestScript = scr
				elseif scr.Tags["ProjectLunar"] then
					lockedBestScript = scr
				end
			end
		end
	end

	if lockedBestScript or bestScript then
		return lockedBestScript or bestScript
	else
		for i, v in pairs(scriptLibrary) do
			if v.Universal == true then
				return v	
			end
		end
	end

	return lockedBestScript or bestScript
end

refreshScriptLibrary()

LunarHub.ScriptSearch.Refresh.Interact.MouseButton1Click:Connect(function()
	refreshScriptLibrary()
end)

LunarHub.CustomScripts.Refresh.Interact.MouseButton1Click:Connect(function()
	refreshCustomLibrary()
end)

--[[ Searching ]]--

local function searchPlayerlist()
	local valid = {}

	for i, scr in pairs(LunarHub.Playerlist.Interactions.List:GetChildren()) do
		if scr.Name ~= "UIListLayout" and scr.Name ~= "Placeholder" and scr.Name ~= "Template" then
			if string.find(string.lower(scr.DisplayName.Text), string.lower(LunarHub.Playerlist.Interactions.SearchFrame.SearchBox.Text)) then
				scr.Visible = true
				table.insert(valid, scr)
			else
				scr.Visible = false
			end
		end
	end

	if #valid == 0 then
		LunarHub.Playerlist.NoPlayers.Visible = true
		LunarHub.Playerlist.NoPlayersDesc.Visible = true
	else
		LunarHub.Playerlist.NoPlayers.Visible = false
		LunarHub.Playerlist.NoPlayersDesc.Visible = false
	end
end

local function searchScripts()
	local valid = {}

	for i, scr in pairs(LunarHub.ScriptSearch.List:GetChildren()) do
		if scr.Name ~= "UIListLayout" and scr.Name ~= "Placeholder" and scr.Name ~= "Template" then
			if string.find(string.lower(scr.Name), string.lower(LunarHub.ScriptSearch.SearchBox.Text)) then
				scr.Visible = true
				table.insert(valid, scr)
			else
				scr.Visible = false
			end
		end
	end

	if #valid == 0 then
		LunarHub.ScriptSearch.NoScriptsTitle.Visible = true
		LunarHub.ScriptSearch.NoScriptsDesc.Visible = true
	else
		LunarHub.ScriptSearch.NoScriptsTitle.Visible = false
		LunarHub.ScriptSearch.NoScriptsDesc.Visible = false
	end
end

local function searchCustomScripts()
	local valid = {}

	for i, scr in pairs(LunarHub.CustomScripts.List:GetChildren()) do
		if scr.Name ~= "UIListLayout" and scr.Name ~= "Placeholder" and scr.Name ~= "Template" then
			if string.find(string.lower(scr.Name), string.lower(LunarHub.CustomScripts.SearchBox.Text)) then
				scr.Visible = true
				table.insert(valid, scr)
			else
				scr.Visible = false
			end
		end
	end

	if #valid == 0 then
		LunarHub.CustomScripts.NoScriptsTitle.Visible = true
		LunarHub.CustomScripts.NoScriptsDesc.Visible = true
	else
		LunarHub.CustomScripts.NoScriptsTitle.Visible = false
		LunarHub.CustomScripts.NoScriptsDesc.Visible = false
	end
end

local function makecustomscript(name, desc, games, loadstr)
	task.spawn(function()
		games = string.gsub(games, " ", "")

		if games ~= "UNIVERSAL" then
			games = string.split(games, ",")
		end

		local newTable = {
			Name = name,
			Description = desc,
			Games = games,
			LoadstringScript = loadstr,
		}

		local httpService = game:GetService("HttpService")
		local _tJSON = httpService:JSONEncode(newTable)

		local newScript = writefile(CustomFolderName .. "/" .. name .. ".txt", _tJSON)
		table.insert(CustomScripts, newTable)

		notifyUser("Successfully created custom script: " .. name .. "!", true)

		savecustomscripts()

		wait(1)

		refreshCustomLibrary()
	end)
end

refreshCustomLibrary()

LunarHub.ScriptSearch.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
	searchScripts()
end)

LunarHub.CustomScripts.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
	searchCustomScripts()
end)

LunarHub.Playerlist.Interactions.SearchFrame.SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
	searchPlayerlist()
end)

local alreadyconnected = false

local function promptGameDetection()
	local bestScript = detectBestScriptForGame()

	local ui = LunarHub.GameDetection

	local _tween = TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,0.25,0)})
	_tween:Play()

	ui.Thumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. game.PlaceId .. "&w=768&h=432"

	if bestScript.Universal == true then
		ui.Layer.Subtitle.Text = "LunarHub couldn't find a script for " .. getGameName() .. ", but we found a universal script you might like! Press Execute or tap 'Y' on your keyboard to execute it!"
	else
		ui.Layer.Subtitle.Text = "LunarHub has a script for " .. getGameName() .. "! Press Execute or tap 'Y' on your keyboard to execute it!"
	end

	if bestScript.KeySys == true then
		ui.Layer.KeySystem.Visible = true
	else
		ui.Layer.KeySystem.Visible = false
	end

	ui.Layer.ScriptName.Text = bestScript.Name
	ui.Layer.ScriptSubtitle.Text = bestScript.Description

	local function executeScript()
		notifyUser("Attempting to execute " .. bestScript.Name .. "...", true)

		local success,err = pcall(function()
			loadstring(bestScript.LoadstringScript)()
		end)

		if success then
			notifyUser("Successfully executed " .. bestScript.Name .. "!",true)
		else
			notifyUser("Failed to execute " .. bestScript.Name .. " - Error message shown in Dev Console [F9]", false)
			warn("LunarHub // Failed to execute " .. bestScript.Name .. " Error Message:\n" .. err)
		end
	end

	local function closePrompt()
		local t = TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,-0.25,0)})
		t:Play()
	end

	if alreadyconnected == false then
		ui.Layer.Execute.MouseButton1Click:Connect(function()
			executeScript()
		end)
	end

	UIS.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.Y and ui.Position == UDim2.new(0.5,0,0.25,0) then
			executeScript()
			wait()
			closePrompt()
		elseif input.KeyCode == Enum.KeyCode.X and ui.Position == UDim2.new(0.5,0,0.25,0) then
			closePrompt()
		end
	end)

	ui.Layer.Close.MouseButton1Click:Connect(function()
		closePrompt()
	end)
end

promptGameDetection()

local function execute(scr)
	if scr.LoadstringScript then
		loadstring(scr.LoadstringScript)()
	else
		notifyUser("Failed to execute " .. scr.Name .. " - Could not identify script", false)
	end
end

local bestScript = detectBestScriptForGame()

LunarHub.Scripts.Interactions.Reprompt.Interact.MouseButton1Click:Connect(function()
	if bestScript ~= nil then
		promptGameDetection()
	end
end)

if bestScript == nil then
	local ui = LunarHub.Scripts.Interactions.Reprompt

	ui.Title.Text= "No Script Found"
	ui.Prompt.Text = "LunarHub could not find a script for this game!"

	ui.UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(100,0,0))})
	ui.UIStroke.Color = Color3.fromRGB(255,0,0)
else
	local ui = LunarHub.Scripts.Interactions.Reprompt

	ui.Title.Text = "Script Found"
	ui.Prompt.Text = "LunarHub found a script for " .. getGameName() .. ". Tap to re-open the prompt."

	ui.UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,127)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 144, 70))})
	ui.UIStroke.Color = Color3.fromRGB(0,255,0)
end

LunarHub.Scripts.Interactions.InfiniteYield.Interact.MouseButton1Click:Connect(function()
	notifyUser("Attempting to execute Infinite Yield...", true)

	local success,err = pcall(function()
		loadstring(scriptLibrary.InfiniteYield.LoadstringScript)()
	end)

	if success then
		notifyUser("Successfully executed Infinite Yield!", true)
	else
		warn("LunarHub // Failed to execute Infinite Yield - Error Message:\n" .. err)
		notifyUser("Failed to execute Infinite Yield - Error message shown in console!", false)
	end
end)

LunarHub.Scripts.Interactions.Library.Interact.MouseButton1Click:Connect(function()
	TS:Create(LunarHub.Scripts, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.6,-90)}):Play()

	refreshScriptLibrary()

	local ui = LunarHub.ScriptSearch

	TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,0.5,0)}):Play()

	ui.Close.MouseButton1Click:Connect(function()
		TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.5,0)}):Play()
		TS:Create(LunarHub.Scripts, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1,-90)}):Play()
	end)
end)

LunarHub.Taskbar.Buttons.Scripts.Interact.MouseButton1Click:Connect(function()
	if LunarHub.Scripts.Position == UDim2.new(0.5,0,1.6,-90) then
		TS:Create(LunarHub.Scripts, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1,-90)}):Play()
	else
		TS:Create(LunarHub.Scripts, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.6,-90)}):Play()
	end
end)

LunarHub.Taskbar.Buttons.Playerlist.Interact.MouseButton1Click:Connect(function()
	local ui = PlayerlistUI

	if ui.Position == UDim2.new(0.5,0,2,-90) then
		TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1,-90)}):Play()
	else
		TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,2,-90)}):Play()
	end
end)

local function openTaskbar()
	local taskbar = LunarHub.Taskbar

	local t = TS:Create(taskbar, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1,-12)})
	t:Play()
end

local function closeTaskbar()
	local taskbar = LunarHub.Taskbar

	local t = TS:Create(taskbar, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.5,-12)})
	t:Play()
end

local function toggleTaskbar()
	local taskbar = LunarHub.Taskbar

	if taskbar.Position == UDim2.new(0.5,0,1.5,-12) then
		openTaskbar()
	else
		closeTaskbar()
	end
end

LunarHub.Taskbar.Buttons.Home.Interact.MouseButton1Click:Connect(function()
	openHome()
end)

UIS.InputBegan:Connect(function(input, gp)
	if gp then return end

	if input.KeyCode == LunarHubSettings.HomeKeybind then
		toggleHome()
	elseif input.KeyCode == LunarHubSettings.TaskbarKeybind then
		toggleTaskbar()
	end
end)

LunarHub.CustomScriptCreator.CreateScript.Interact.MouseButton1Click:Connect(function()
	local ui = LunarHub.CustomScriptCreator

	if ui.NameInput.Text == "" then
		notifyUser("Please enter a name for the custom script!", false)
		return
	end

	if ui.GamesInput.Text == "" then
		notifyUser("Please a valid game list or type 'UNIVERSAL' into the textbox if your script is universal!", false)
		return
	end

	if ui.LoadstringInput.Text == "" then
		notifyUser("Please enter a valid script!", false)
		return
	end

	local gms = ui.GamesInput

	if string.upper(gms.Text) == "UNIVERSAL" then
		gms = "UNIVERSAL"
	else
		gms = ui.GamesInput.Text
	end

	makecustomscript(ui.NameInput.Text, ui.DescInput.Text, gms, ui.LoadstringInput.Text)
end)

LunarHub.CustomScriptCreator.Cancel.Interact.MouseButton1Click:Connect(function()
	local ui = LunarHub.CustomScriptCreator

	TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.35,0)}):Play()
end)

LunarHub.CustomScriptCreator.ViewLibrary.Interact.MouseButton1Click:Connect(function()
	local ui = LunarHub.CustomScripts

	TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,0.5,0)}):Play()
	TS:Create(LunarHub.CustomScriptCreator, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.35,0)}):Play()

	ui.Close.MouseButton1Click:Connect(function()
		TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.5,0)}):Play()
	end)
end)

ScriptsUI.Interactions.CustomScripts.Interact.MouseButton1Click:Connect(function()
	local ui = LunarHub.CustomScriptCreator

	TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,0.5,0)}):Play()
end)

--[[ Settings UI ]]--

if _G.OverrideSettings then
	LunarHubSettings = _G.OverrideSettings
end

local function getToggleValue(toggle)
	local icon = toggle:FindFirstChild("Icon")

	if icon then
		if icon.ImageColor3 == Color3.fromRGB(170, 0, 0) then
			return false
		else
			return true
		end
	else
		warn("LunarHub // ERR: Failed to get toggle value!")
		return nil
	end
end

local function toggleToggle(toggle)
	local icon = toggle:FindFirstChild("Icon")

	if icon then
		if icon.ImageColor3 == Color3.fromRGB(170, 0, 0) then
			local ttt = TS:Create(icon, SecondaryTweenInfo, {ImageColor3 = Color3.fromRGB(0, 255, 127)})
			ttt:Play()
			ttt.Completed:Wait()

			return true
		else
			local ttt = TS:Create(icon, SecondaryTweenInfo, {ImageColor3 = Color3.fromRGB(170, 0, 0)})
			ttt:Play()
			ttt.Completed:Wait()

			return false
		end
	else
		warn("LunarHub // ERR: Failed to toggle the toggle!")
		return nil
	end
end

local sui = SettingsUI.Settings --SUIIIIIIIIIIIIIIIIIIII

local function getSettings()
	local newSettings = {
		Theme = "DARK",
		TaskbarKeybind = Enum.KeyCode.E,
		HomeKeybind = Enum.KeyCode.H,
		TimeFormat = 12,
		ShowSeconds = false,
	}

	newSettings.ShowSeconds = getToggleValue(sui.SecondsToggle)

	local tf = getToggleValue(sui.TimeToggle)

	if tf == true then
		newSettings.TimeFormat = 24
	else
		newSettings.TimeFormat = 12
	end

	newSettings.TaskbarKeybind = tostring(LunarHubSettings.TaskbarKeybind)
	newSettings.HomeKeybind = tostring(LunarHubSettings.HomeKeybind)

	newSettings.Theme = ThemeUI.SelectedTheme.Value

	return newSettings
end

sui.SecondsToggle.Interact.MouseButton1Click:Connect(function()
	local newVal = toggleToggle(sui.SecondsToggle)

	LunarHubSettings.ShowSeconds = newVal
end)

sui.TimeToggle.Interact.MouseButton1Click:Connect(function()
	local newVal = toggleToggle(sui.TimeToggle)

	if newVal == true then
		LunarHubSettings.TimeFormat = 24
	else
		LunarHubSettings.TimeFormat = 12
	end
end)

sui:WaitForChild("HomeKeybind"):WaitForChild("Interact").MouseButton1Click:Connect(function()
	sui.HomeKeybind.KeybindFrame.CurrentBind.Text = "Press Key"
end)

sui.HomeKeybind.KeybindFrame.CurrentBind.Text = string.sub(tostring(LunarHubSettings.HomeKeybind), 14)
sui.TaskbarKeybind.KeybindFrame.CurrentBind.Text = string.sub(tostring(LunarHubSettings.TaskbarKeybind), 14)

sui:WaitForChild("TaskbarKeybind"):WaitForChild("Interact").MouseButton1Click:Connect(function()
	sui.TaskbarKeybind.KeybindFrame.CurrentBind.Text = "Press Key"
end)

UIS.InputBegan:Connect(function(input)
	if sui:WaitForChild("HomeKeybind"):WaitForChild("KeybindFrame"):WaitForChild("CurrentBind").Text == "Press Key" then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == LunarHubSettings.TaskbarKeybind then
				notifyUser("You cannot set two keybinds to the same value!", false)
				return
			end

			local keyStr = string.sub(tostring(input.KeyCode), 14)

			sui.HomeKeybind.KeybindFrame.CurrentBind.Text = keyStr

			LunarHubSettings.HomeKeybind = input.KeyCode
		end
	end

	if sui:WaitForChild("TaskbarKeybind"):WaitForChild("KeybindFrame"):WaitForChild("CurrentBind").Text == "Press Key" then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == LunarHubSettings.HomeKeybind then
				notifyUser("You cannot set two keybinds to the same value!", false)
				return
			end

			local keyStr = string.sub(tostring(input.KeyCode), 14)

			sui.TaskbarKeybind.KeybindFrame.CurrentBind.Text = keyStr

			wait(0.05)

			LunarHubSettings.TaskbarKeybind = input.KeyCode
		end
	end
end)

TaskbarUI.Buttons.Settings.Interact.MouseButton1Click:Connect(function()
	TS:Create(SettingsUI, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,0.5,0)}):Play()
end)

SettingsUI.Close.MouseButton1Click:Connect(function()
	TS:Create(SettingsUI, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.5,0)}):Play()
	writesettings(getSettings())
end)

writesettings(getSettings())

--[[ Quick Play ]]--

local quickPlayUI = LunarHub.QuickPlay

local template = quickPlayUI:WaitForChild("List"):WaitForChild("Template")
template.Visible = false

local quickPlayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/probablYnicKxD/ProjectLunar/main/LunarHub/QuickPlayGames.lua"))()

local function addGameToList(gm)
	local new = template:Clone()

	local gminfo = game:GetService("MarketplaceService"):GetProductInfo(gm.GameID)

	new.Parent = quickPlayUI:WaitForChild("List")
	new.GameName.Text = gminfo.Name
	new.GameName.TextTruncate = Enum.TextTruncate.AtEnd
	new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. gm.GameID .. "&w=768&h=432"
	new.Visible = true
	new:WaitForChild("Interact").ZIndex = 2
	new.GameThumbnail.ZIndex = 1
	quickPlayUI.Close.ZIndex = 1

	new.Interact.MouseButton1Click:Connect(function()
		local ui = quickPlayUI.GameInfo

		ui.Close.ZIndex = 99999
		ui.CanvasPosition = Vector2.new(0,0,0,0)
		ui.GameName.Text = gminfo.Name
		ui.GameName.TextTruncate = Enum.TextTruncate.AtEnd
		ui.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. gm.GameID .. "&w=768&h=432"
		ui.GameCreator.Text = "Created by " .. gm.GameCreator
		ui.GameDesc.Text = gminfo.Description

		TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,0.5,0)}):Play()

		ui.PlayButton.Position = UDim2.new(0.75,0,ui.PlayButton.Position.Y.Scale,ui.PlayButton.Position.Y.Offset)

		ui.PlayButton.MouseButton1Click:Connect(function()
			notifyUser("Attempting to join " .. gm.Name .. "...", true)

			local success, errMsg = pcall(function()
				game:GetService('TeleportService'):Teleport(gm.GameID, game.Players.LocalPlayer)
			end)

			if not success and errMsg then
				notifyUser("Failed to join " .. gm.Name .. " - Error message shown in Dev Console [F9]", false)
				warn("LunarHub // Failed to join " .. gm.Name .. " - Error Message:\n" .. errMsg)
			end
		end)

		ui.Close.MouseButton1Click:Connect(function()
			TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,-0.5,0)}):Play()
		end)
	end)

	local list = quickPlayUI:WaitForChild("List")

	list.CanvasSize = UDim2.new(0,list.CanvasSize.X.Offset + 412.5,0,0)
end

local scropen
local tskopen

local function openQuickPlay()
	if LunarHub.Scripts.Position == UDim2.new(0.5,0,1,-90) then
		scropen = true
	else
		scropen = false
	end

	if LunarHub.Taskbar.Position == UDim2.new(0.5,0,1,-12) then
		tskopen = true
	else
		tskopen = false
	end

	TS:Create(LunarHub.Scripts, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.6,-90)}):Play()
	TS:Create(LunarHub.Taskbar, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.2,-12)}):Play()

	TS:Create(LunarHub.DarkBG, SecondaryTweenInfo, {BackgroundTransparency = 0.7}):Play()
	TS:Create(quickPlayUI, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,0.5,0)}):Play()

	inBlur()
end

local function closeQuickPlay()
	if scropen then
		TS:Create(LunarHub.Scripts, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1,-90)}):Play()
	end

	if tskopen then
		TS:Create(LunarHub.Taskbar, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1,-12)}):Play()
	end

	TS:Create(LunarHub.DarkBG, SecondaryTweenInfo, {BackgroundTransparency = 1}):Play()
	TS:Create(quickPlayUI, SecondaryTweenInfo, {Position = UDim2.new(-0.5,0,0.5,0)}):Play()

	outDeBlur()
end

local function toggleQuickPlay()
	if quickPlayUI.Position == UDim2.new(0.5,0,0.5,0) then
		closeQuickPlay()
	else
		openQuickPlay()
	end
end

local function refreshQuickPlay()
	for i, already in pairs(quickPlayUI.List:GetChildren()) do
		if already.Name ~= "UIListLayout" and already.Name ~= "Placeholder" and already.Name ~= "Template" then
			already:Destroy()
		end
	end

	for i, LunarHubGame in pairs(quickPlayLibrary.Games) do
		addGameToList(LunarHubGame)
	end
end

refreshQuickPlay()

TaskbarUI.Buttons.QuickPlay.Interact.MouseButton1Click:Connect(function()
	openQuickPlay()
end)

quickPlayUI.Close.MouseButton1Click:Connect(function()
	closeQuickPlay()
end)

--[[ Join Codes ]]--

local function generateJoinCode()
	local from = game.JobId
	local joinCode = "LunarHubJoinCode_" .. game.PlaceId .. "_"

	if from == "" then return end

	if game:GetService("RunService"):IsStudio() then return end

	local splitFrom = string.split(from, "")

	for i, char in pairs(splitFrom) do
		if char == "-" then
			joinCode = joinCode .. "."
		else
			joinCode = joinCode .. char
		end
	end

	return joinCode
end

local function translateJoinCode(code)
	local args = string.split(code, "_")
	local serverID = ""
	local gameID = nil

	if args[1] and args[2] and args[3] then
		gameID = tonumber(args[2])
		local from = string.split(args[3], "")

		for i, char in pairs(from) do
			if char == "." then
				serverID = serverID .. "-"
			else
				serverID = serverID .. char
			end
		end

		return gameID, serverID
	end
end

local joinUI = LunarHub:WaitForChild("JoinCodes"):WaitForChild("Layer")

joinUI.Parent:WaitForChild("Thumbnail").Image = "rbxthumb://type=GameThumbnail&id=" .. game.PlaceId .. "&w=768&h=432"

joinUI.Close.MouseButton1Click:Connect(function()
	TS:Create(joinUI.Parent, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.75,-70)}):Play()
end)

TaskbarUI.Buttons.JoinCodes.Interact.MouseButton1Click:Connect(function()
	TS:Create(joinUI.Parent, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,0.75,-70)}):Play()
end)

joinUI.Create.MouseButton1Click:Connect(function()
	local success,errMsg = pcall(function()
		setclipboard(generateJoinCode())
	end)

	if success then
		notifyUser("Successfully copied your LunarHub Join Code to your clipboard!", true)
	elseif not success and errMsg then
		notifyUser("Failed to create a LunarHub Join Code. Error message shown in Developer Console. [F9]", false)
		warn("LunarHub // Failed to create LunarHub Join Code - Error Message:\n" .. errMsg)
	end
end)

joinUI.Join.MouseButton1Click:Connect(function()
	notifyUser("Attempting to join server via LunarHub Join Code...", true)

	local gameID, serverID = translateJoinCode(joinUI.JoinCodeInput.Text)

	if gameID and serverID then
		local success, errMsg =  pcall(function()
			game:GetService('TeleportService'):TeleportToPlaceInstance(gameID, serverID, game.Players.LocalPlayer)
		end)

		if success then
			notifyUser("Attempting to teleport you to server...", true)
		elseif not success and errMsg then
			notifyUser("Failed to teleport you to server via LunarHub Join Code! Error message shown in Dev Console. [F9]", false)
			warn("LunarHub // Failed to join via LunarHub Join Code - Error Message:\n" .. errMsg)
		end
	else
		notifyUser("Failed to join server via LunarHub Join Code!", false)
	end
end)

--[[ spawned functions ]]--

spawn(function()
	while wait() do
		local fps = game:GetService("Workspace"):GetRealPhysicsFPS()
		fpsCounter:WaitForChild("Info").Text = tostring(fps) .. " FPS"
	end
end)

spawn(function()
	while wait(0.1) do
		if getTimeSinceBoot("min") == 0 then
			timeElapsedUI.Time.Text = tostring(getTimeSinceBoot("sec")) .. " seconds"
		elseif getTimeSinceBoot("min") > 60 then
			timeElapsedUI.Time.Text = tostring(getTimeSinceBoot("hour")) .. " hours"
		else
			timeElapsedUI.Time.Text = tostring(getTimeSinceBoot("min")) .. " minutes"
		end

		local date,dateMsg,hour = getDate()

		HomeUI.Title.Text = dateMsg .. ", " .. game.Players.LocalPlayer.DisplayName
		HomeUI.Subtitle.Text = msgToSub(hour)

		HomeUI.CurrentTime.Info.Text = date

		LunarHub.Taskbar.Time.Text = date
	end
end)

local connectedAntiIdle

local function enableAntiIdle()
	local VU = game:GetService("VirtualUser")

	local cam = game.Workspace.CurrentCamera or game.Workspace.Camera or game.Workspace:FindFirstChildWhichIsA("Camera")

	if cam then
		connectedAntiIdle = game.Players.LocalPlayer.Idled:Connect(function()
			VU:Button2Down(Vector2.new(0,0),cam.CFrame)
			wait(1)
			VU:Button2Up(Vector2.new(0,0),cam.CFrame)
		end)

		notifyUser("LunarHub is currently protecting you from getting disconnected!", true)

		return true
	else
		notifyUser("LunarHub failed to protect you from getting disconnected - Failed to find camera!", false)
		return false
	end
end

local function disableAntiIdle()
	local VU = game:GetService("VirtualUser")

	connectedAntiIdle:Disconnect()
end

enableAntiIdle()

local function openIdle()
	local ui = LunarHub:WaitForChild("Idle")

	closeHome()
	closeTaskbar()
	closeQuickPlay()

	ui.Visible = true

	ui.Title.Text = "Don't worry, " .. game.Players.LocalPlayer.DisplayName .. "!"
	ui.Subtitle.Text = "We're currently protecting you from getting disconnected."

	TS:Create(LunarHub:WaitForChild("DarkBG"), SecondaryTweenInfo, {BackgroundTransparency = 0.7}):Play()
	TS:Create(ui.Title, SecondaryTweenInfo, {TextTransparency = 0}):Play()
	TS:Create(ui.Subtitle, SecondaryTweenInfo, {TextTransparency = 0}):Play()

	inBlur()
end

local function closeIdle()
	task.spawn(function()
		local ui = LunarHub:WaitForChild("Idle")

		ui.Title.Text = "Welcome back, " .. game.Players.LocalPlayer.DisplayName .. "!"
		ui.Subtitle.Text = "We kept you from getting disconnected."

		wait(1.5)

		TS:Create(LunarHub:WaitForChild("DarkBG"), SecondaryTweenInfo, {BackgroundTransparency = 1}):Play()
		TS:Create(ui.Title, SecondaryTweenInfo, {TextTransparency = 1}):Play()
		local lastTween = TS:Create(ui.Subtitle, SecondaryTweenInfo, {TextTransparency = 1})
		lastTween:Play()

		outDeBlur()
		openTaskbar()

		lastTween.Completed:Wait()

		ui.Visible = false
	end)
end

local timeUntilIdle = 60

UIS.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard or input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.MouseButton3 or input.UserInputType == Enum.UserInputType.MouseWheel then
		timeUntilIdle = 60

		if LunarHub:WaitForChild("Idle").Visible == true then
			closeIdle()
		end
	end
end)

--[[ Character UI ]]--

local charUI = LunarHub:WaitForChild("Character")

local charUIOpen = false

TaskbarUI:WaitForChild("Buttons"):WaitForChild("Character"):WaitForChild("Interact").MouseButton1Click:Connect(function()
	if charUIOpen == true then
		TS:Create(charUI, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,2,-90)}):Play()
		charUIOpen = false
	else
		TS:Create(charUI, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1,-90)}):Play()
		charUIOpen = true
	end
end)

local charinter = charUI:WaitForChild("Interactions")

local function inrange(num, min, max)
	if num >= min and num <= max then
		return true
	else
		return false
	end
end

local function getColorByGood(typeofstat, num)
	local stat = string.lower(typeofstat)

	if stat == "ping" then
		if inrange(num, 0, 50) then
			return Color3.fromRGB(0, 255 ,0)
		elseif inrange(num, 51, 149) then
			return Color3.fromRGB(255, 119, 0)
		elseif inrange(num, 150, 250) then
			return Color3.fromRGB(255, 0, 0)
		elseif inrange(num, 251, 499) then
			return Color3.fromRGB(170, 0, 0)
		elseif inrange(num, 500, 9e9) then
			return Color3.fromRGB(85, 0, 0)
		else
			return Color3.fromRGB(0, 0, 0)
		end
	elseif stat == "fps" then
		if inrange(num, 0, 10) then
			return Color3.fromRGB(85, 0, 0)
		elseif inrange(num, 11, 29) then
			return Color3.fromRGB(170, 0, 0)
		elseif inrange(num, 30, 45) then
			return Color3.fromRGB(255,0,0)
		elseif inrange(num, 46, 59) then
			return Color3.fromRGB(255, 199, 0)
		elseif inrange(num, 60, 100) then
			return Color3.fromRGB(0, 255, 0)
		elseif inrange(num, 101, 300) then
			return Color3.fromRGB(0, 170, 0)
		elseif inrange(num, 301, 9e9) then
			return Color3.fromRGB(0, 85, 0)
		else
			return Color3.fromRGB(0, 0, 0)
		end
	else
		return Color3.fromRGB(0, 0, 0)
	end
end

local function addCharToggle(name : string, oncolor : Color3, func : "function", imageprops : table, listnum : number, default : boolean)
	local currentval = default

	local new = charinter:WaitForChild("List1"):WaitForChild("Noclip"):Clone()
	new.Name = name

	if default == true then
		new.BackgroundColor3 = oncolor
		new:WaitForChild("UIStroke").Color = oncolor
	else
		new.BackgroundColor3 = Color3.fromRGB(50,50,50)
		new:WaitForChild("UIStroke").Color = Color3.fromRGB(50,50,50)
	end

	new:WaitForChild("Icon").Image = imageprops.Image
	new:WaitForChild("Icon").ImageRectOffset = imageprops.ImageRectOffset
	new:WaitForChild("Icon").ImageRectSize = imageprops.ImageRectSize

	new:WaitForChild("Interact").MouseButton1Click:Connect(function()
		currentval = not currentval

		if currentval == true then
			TS:Create(new, SecondaryTweenInfo, {BackgroundColor3 = oncolor}):Play()
			TS:Create(new.UIStroke, SecondaryTweenInfo, {Color = oncolor}):Play()
		else
			TS:Create(new, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
			TS:Create(new.UIStroke, SecondaryTweenInfo, {Color = Color3.fromRGB(50,50,50)}):Play()
		end

		func(currentval)
	end)

	new.Parent = charinter:WaitForChild("List" .. tostring(listnum))
end

addCharToggle("FPS", Color3.fromRGB(255, 0, 0), function(val)
	local LunarHubStats = LunarHub:WaitForChild("Stats")

	LunarHubStats:WaitForChild("FPS").Visible = val
end, {Image = "rbxassetid://3926305904", ImageRectOffset = Vector2.new(564, 684), ImageRectSize = Vector2.new(36, 36)}, 1, false)

--[[ inf zoom ]]--

local oldmaxzoomdistance = game.Players.LocalPlayer.CameraMaxZoomDistance
local oldminzoomdistance = game.Players.LocalPlayer.CameraMinZoomDistance

addCharToggle("InfiniteZoom", Color3.fromRGB(0, 255, 255), function(val)
	local cam = game.Workspace.CurrentCamera or game.Workspace.Camera or game.Workspace:FindFirstChildWhichIsA("Camera")

	if cam then
		if val == true then
			game.Players.LocalPlayer.CameraMaxZoomDistance = math.huge
			game.Players.LocalPlayer.CameraMinZoomDistance = 0
			notifyUser("Activated infinite camera zoom!", true)
		else
			game.Players.LocalPlayer.CameraMaxZoomDistance = oldmaxzoomdistance
			game.Players.LocalPlayer.CameraMinZoomDistance = oldminzoomdistance
			notifyUser("Deactivated infinite camera zoom!", true)
		end
	end
end, {Image = "rbxassetid://6764432408", ImageRectOffset = Vector2.new(0, 650), ImageRectSize = Vector2.new(50, 50)}, 1, false)

--[[ ping ]]--

addCharToggle("Ping", Color3.fromRGB(170, 0, 255), function(val)
	local LunarHubStats = LunarHub:WaitForChild("Stats")

	LunarHubStats:WaitForChild("Ping").Visible = val
end, {Image = "rbxassetid://3926307971", ImageRectOffset = Vector2.new(4, 284), ImageRectSize = Vector2.new(36, 36)}, 2, false)

task.spawn(function()
	while wait() do
		local fps = game.Workspace:GetRealPhysicsFPS()

		LunarHub:WaitForChild("Stats"):WaitForChild("FPS").Text = "FPS: " .. tostring(fps)
		TS:Create(LunarHub:WaitForChild("Stats"):WaitForChild("FPS"):WaitForChild("Outline"), SecondaryTweenInfo, {Color = getColorByGood("fps", fps)}):Play()
	end
end)

task.spawn(function()
	while wait() do
		local ping = math.floor(game:GetService("Stats").PerformanceStats.Ping:GetValue() + 0.5)

		LunarHub:WaitForChild("Stats"):WaitForChild("Ping").Text = "PING: " .. tostring(ping) .. " ms"
		TS:Create(LunarHub:WaitForChild("Stats"):WaitForChild("Ping"):WaitForChild("Outline"), SecondaryTweenInfo, {Color = getColorByGood("ping", ping)}):Play()
	end
end)

local mouse = game.Players.LocalPlayer:GetMouse()

local function tweenSlider(frame, props)
	TS:Create(frame, SecondaryTweenInfo, props):Play()
end

local function activateSlider(slider, name, minvalue, maxvalue, callback)
	local Value
	local moveconnection
	local releaseconnection

	slider.Interact.MouseButton1Down:Connect(function()
		Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 224) * slider.Progress.AbsoluteSize.X) + tonumber(minvalue)) or 0
		pcall(function()
			callback(Value)
		end)
		tweenSlider(slider.Progress, {Size = UDim2.new(0, math.clamp(mouse.X - slider.Progress.AbsolutePosition.X, 0, 224), 1, 0)})
		moveconnection = mouse.Move:Connect(function()
			slider.Information.Text = Value .. " " .. name
			Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 224) * slider.Progress.AbsoluteSize.X) + tonumber(minvalue))
			pcall(function()
				callback(Value)
			end)
			tweenSlider(slider.Progress, {Size = UDim2.new(0, math.clamp(mouse.X - slider.Progress.AbsolutePosition.X, 0, 224), 1, 0)})
		end)
		releaseconnection = UIS.InputEnded:Connect(function(Mouse)
			if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 224) * slider.Progress.AbsoluteSize.X) + tonumber(minvalue))
				pcall(function()
					callback(Value)
				end)
				tweenSlider(slider.Progress, {Size = UDim2.new(0, math.clamp(mouse.X - slider.Progress.AbsolutePosition.X, 0, 224), 1, 0)})
				moveconnection:Disconnect()
				releaseconnection:Disconnect()
			end
		end)
	end)
end

activateSlider(charinter:WaitForChild("FOVSlider"), "field of view", 70, 150, function(val)
	local cam = game.Workspace.CurrentCamera or game.Workspace.Camera or game.Workspace:FindFirstChildWhichIsA("Camera")

	if cam then
		TS:Create(cam, SecondaryTweenInfo, {FieldOfView = val}):Play()
	end
end)

activateSlider(charinter:WaitForChild("JumpSlider"), "jump power", 50, 300, function(val)
	local hum = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")

	if hum then
		hum.JumpPower = val
	end
end)

activateSlider(charinter:WaitForChild("SpeedSlider"), "walk speed", 16, 500, function(val)
	local hum = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")

	if hum then
		hum.WalkSpeed = val
	end
end)

local LunarHubFlySpeed = 50

--fly script by unknown, too lazy to make one myself lol

task.spawn(function()
	local plr = game.Players.LocalPlayer
	local torso = plr.Character.HumanoidRootPart or plr.Character.Torso
	local flying = true
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local speed = 0

	local function Fly()
		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		repeat wait()
			plr.Character.Humanoid.PlatformStand = true
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/LunarHubFlySpeed)
				if speed > LunarHubFlySpeed then
					speed = LunarHubFlySpeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).Position) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).Position) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0.1,0)
			end
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/LunarHubFlySpeed),0,0)
		until not flying
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
	end
	mouse.KeyDown:connect(function(key)
		if key:lower() == "w" then
			ctrl.f = 1
		elseif key:lower() == "s" then
			ctrl.b = -1
		elseif key:lower() == "a" then
			ctrl.l = -1
		elseif key:lower() == "d" then
			ctrl.r = 1
		end
	end)
	mouse.KeyUp:connect(function(key)
		if key:lower() == "w" then
			ctrl.f = 0
		elseif key:lower() == "s" then
			ctrl.b = 0
		elseif key:lower() == "a" then
			ctrl.l = 0
		elseif key:lower() == "d" then
			ctrl.r = 0
		end
	end)

	charinter:WaitForChild("List1"):WaitForChild("Flight").Visible = false
end)

charinter:WaitForChild("FlightSlider").Visible = false
charinter:WaitForChild("FOVSlider").Position = charinter:WaitForChild("FlightSlider").Position
charinter:WaitForChild("FOVSlider"):WaitForChild("UIStroke").Color = Color3.fromRGB(255,0,0)

local clipped = true
local noclipconnection

local function noclip()
	local success, errMsg = pcall(function()
		clipped = false
		wait(0.1)
		local function nocliploop()
			if clipped == false and LocalPlayer.Character ~= nil then
				for _, child in pairs(LocalPlayer.Character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide == true then
						child.CanCollide = false
					end
				end
			end
		end
		noclipconnection = game:GetService('RunService').Stepped:Connect(nocliploop)
	end)

	if success then
		notifyUser("Successfully enabled noclip!", true)
	elseif not success and errMsg then
		warn("LunarHub // Failed to enable noclip - Error Message:\n" .. errMsg)
		notifyUser("Failed to enable noclip - Error message shown in Dev Console [F9]", false)
	end
end

function clip()
	local success, errMsg = pcall(function()
		if noclipconnection then
			noclipconnection:Disconnect()
		end
		clipped = true
	end)

	if success then
		notifyUser("Successfully disabled noclip!", true)
	elseif not success and errMsg then
		warn("LunarHub // Failed to disable noclip - Error Message:\n" .. errMsg)
		notifyUser("Failed to disable noclip - Error message shown in Dev Console [F9]", false)
	end
end

local noclipbutton = charinter:WaitForChild("List1"):WaitForChild("Noclip")

TS:Create(noclipbutton, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
TS:Create(noclipbutton.UIStroke, SecondaryTweenInfo, {Color = Color3.fromRGB(50, 50, 50)}):Play()

charinter:WaitForChild("List1"):WaitForChild("Noclip"):WaitForChild("Interact").MouseButton1Click:Connect(function()
	local button = charinter:WaitForChild("List1"):WaitForChild("Noclip")

	if clipped == false then
		TS:Create(button, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
		TS:Create(button.UIStroke, SecondaryTweenInfo, {Color = Color3.fromRGB(50, 50, 50)}):Play()
		clip()
	else
		TS:Create(button, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(0, 255, 127)}):Play()
		TS:Create(button.UIStroke, SecondaryTweenInfo, {Color = Color3.fromRGB(0, 255, 127)}):Play()
		noclip()
	end
end)

local function refresh()
	notifyUser("Refreshing character... This can take a few seconds!", true)
	local success,errMsg = pcall(function()
		local prevpos = LocalPlayer.Character.HumanoidRootPart.CFrame
		LocalPlayer.Character.Humanoid.Health = 0
		if LocalPlayer.Character:FindFirstChild("Head") then
			LocalPlayer.Character.Head:Destroy()
		end
		LocalPlayer.CharacterAdded:Wait()
		LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		LocalPlayer.Character.HumanoidRootPart.CFrame = prevpos
	end)

	if success then
		notifyUser("Successfully refreshed your character!", true)
	elseif not success and errMsg then
		notifyUser("Failed to refresh your character - Error message shown in Dev Console [F9]", false)
		warn("LunarHub // Failed to refresh " .. LocalPlayer.DisplayName .. "'s character - Error Message:\n" .. errMsg)
	end
end

local function respawn()
	notifyUser("Respawning character... This can take a few seconds!", true)
	local success,errMsg = pcall(function()
		local Character = LocalPlayer.Character
		if Character:FindFirstChildOfClass("Humanoid") then 
			Character:FindFirstChildOfClass("Humanoid"):ChangeState(15) 
		end
		Character:ClearAllChildren()
		local newChar = Instance.new("Model")
		newChar.Parent = workspace
		LocalPlayer.Character = newChar
		wait()
		LocalPlayer.Character = Character
		newChar:Destroy()
	end)

	if success then
		notifyUser("Successfully respawned your character!", true)
	elseif not success and errMsg then
		notifyUser("Failed to respawn your character - Error message shown in Dev Console [F9]", false)
		warn("LunarHub // Failed to respawn " .. LocalPlayer.DisplayName .. "'s character - Error Message:\n" .. errMsg)
	end
end

local function toggleDay()
	local lighting = game:GetService("Lighting")

	if lighting.ClockTime == 12 then
		lighting.TimeOfDay = 0
		notifyUser("Successfully changed to night time.", true)
		return false
	else
		lighting.TimeOfDay = 12
		notifyUser("Successfully changed to day time.", true)
		return true
	end
end

local espEnabled = false

local addedconnection

local function newESP(plr)
	local newHighlight = Instance.new("Highlight")

	if plr.Character then
		newHighlight.Parent = plr.Character

		newHighlight.Archivable = true
		newHighlight.Adornee = plr.Character
		newHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		newHighlight.Enabled = true
		newHighlight.FillColor = Color3.fromRGB(170, 221, 255)
		newHighlight.FillTransparency = 0
		newHighlight.Name = "LunarHubESPHighlight"
		newHighlight.OutlineColor = Color3.fromRGB(0,0,0)
		newHighlight.OutlineTransparency = 0

		return newHighlight
	else
		newHighlight:Destroy()
		return nil
	end
end

local function enableESP()
	for i, plr in pairs(game.Players:GetPlayers()) do
		newESP(plr)
	end

	addedconnection = game.Players.PlayerAdded:Connect(function(plr)
		wait(2)

		newESP(plr)
	end)

	espEnabled = true

	notifyUser("Successfully enabled ESP!", true)

	--no need for a connection when they leave as when they leave their character automatically removes the ESP highlight!
end

local function disableESP()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr.Character and plr.Character:FindFirstChild("LunarHubESPHighlight") then
			plr.Character.LunarHubESPHighlight:Destroy()
		end
	end

	if addedconnection then
		addedconnection:Disconnect()
	end

	espEnabled = false

	notifyUser("Successfully disabled ESP!", true)
end

local function toggleESP()
	if espEnabled == true then
		disableESP()
	else
		enableESP()
	end
end

local audioDisabled = false

local function toggleAudio()
	if audioDisabled == false then
		for i, v in pairs(game.Workspace:GetDescendants()) do
			if v:IsA("Sound") then
				local new = Instance.new("IntValue", v)
				new.Name = "LunarHubLastVolume"
				new.Value = v.Volume

				wait()

				v.Volume = 0
			end
		end

		notifyUser("Attempted to disable workspace audio!", true)
		audioDisabled = true
	else
		for i, v in pairs(game:GetDescendants()) do
			if v:IsA("Sound") then
				if v:FindFirstChild("LunarHubLastVolume") then
					v.Volume = v.LunarHubLastVolume.Value
				end
			end
		end

		notifyUser("Attempted to enable workspace audio!", true)
		audioDisabled = false
	end
end



local listone = charinter:WaitForChild("List1")
local listtwo = charinter:WaitForChild("List2")

listone:WaitForChild("Refresh"):WaitForChild("Interact").MouseButton1Click:Connect(function()
	refresh()
end)

listtwo:WaitForChild("Respawn"):WaitForChild("Interact").MouseButton1Click:Connect(function()
	respawn()
end)

listtwo:WaitForChild("Night"):WaitForChild("Interact").MouseButton1Click:Connect(function()
	local daytime = toggleDay()

	if daytime then
		TS:Create(listtwo.Night, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(255,255,0)}):Play()
		TS:Create(listtwo.Night.UIStroke, SecondaryTweenInfo, {Color = Color3.fromRGB(255,255,0)}):Play()
		listtwo.Night.Icon.Image = "rbxassetid://9134778004"
		listtwo.Night.Icon.ImageRectOffset = Vector2.new(0, 0)
		listtwo.Night.Icon.ImageRectSize = Vector2.new(0, 0)
		listtwo.Night.Icon.Rotation = 0
	else
		TS:Create(listtwo.Night, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(0,0,39)}):Play()
		TS:Create(listtwo.Night.UIStroke, SecondaryTweenInfo, {Color = Color3.fromRGB(0, 0, 39)}):Play()
		listtwo.Night.Icon.Image = "rbxassetid://3926307971"
		listtwo.Night.Icon.ImageRectOffset = Vector2.new(684, 84)
		listtwo.Night.Icon.ImageRectSize = Vector2.new(36, 36)
		listtwo.Night.Icon.Rotation = 180
	end
end)

listtwo:WaitForChild("Audio"):WaitForChild("Interact").MouseButton1Click:Connect(function()
	task.spawn(function()
		toggleAudio()

		wait()

		if audioDisabled then
			TS:Create(listtwo.Audio, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(100,100,100)}):Play()
			TS:Create(listtwo.Audio.UIStroke, SecondaryTweenInfo, {Color = Color3.fromRGB(100,100,100)}):Play()
			listtwo.Audio.Icon.Image = "rbxassetid://9134774810"
			listtwo.Audio.Icon.ImageRectOffset = Vector2.new(0, 0)
			listtwo.Audio.Icon.ImageRectSize = Vector2.new(0, 0)
		else
			TS:Create(listtwo.Audio, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(85, 0, 255)}):Play()
			TS:Create(listtwo.Audio.UIStroke, SecondaryTweenInfo, {Color = Color3.fromRGB(85, 0, 255)}):Play()
			listtwo.Audio.Icon.Image = "rbxassetid://3926307971"
			listtwo.Audio.Icon.ImageRectOffset = Vector2.new(684, 324)
			listtwo.Audio.Icon.ImageRectSize = Vector2.new(36, 36)
		end
	end)
end)

listone:WaitForChild("ESP"):WaitForChild("Interact").MouseButton1Click:Connect(function()
	toggleESP()

	wait()

	if espEnabled == false then
		TS:Create(listone.ESP, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(100,100,100)}):Play()
		TS:Create(listone.ESP.UIStroke, SecondaryTweenInfo, {Color = Color3.fromRGB(100,100,100)}):Play()
	else
		TS:Create(listone.ESP, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(0, 0, 255)}):Play()
		TS:Create(listone.ESP.UIStroke, SecondaryTweenInfo, {Color = Color3.fromRGB(0, 0, 255)}):Play()
	end
end)

--[[ Keystrokes UI ]]--

local keystrokes = LunarHub:WaitForChild("KeystrokesUI")

keystrokes.ZIndex = -1

--toggling

UIS.InputBegan:Connect(function(input, gp)
	if gp then return end

	if UIS:IsKeyDown(Enum.KeyCode.LeftControl) and input.KeyCode == Enum.KeyCode.K then
		keystrokes.Visible = not keystrokes.Visible
	end
end)

local function onKey(tl)
	if tl then
		TS:Create(tl, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(170, 221, 255)}):Play()
	end
end

local function offKey(tl)
	if tl then
		TS:Create(tl, SecondaryTweenInfo, {BackgroundColor3 = Color3.fromRGB(0, 0, 0)}):Play()
	end
end

UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.W then
		onKey(keystrokes:WaitForChild("WKey"))
	end

	if input.KeyCode == Enum.KeyCode.A then
		onKey(keystrokes:WaitForChild("AKey"))
	end

	if input.KeyCode == Enum.KeyCode.S then
		onKey(keystrokes:WaitForChild("SKey"))
	end

	if input.KeyCode == Enum.KeyCode.D then
		onKey(keystrokes:WaitForChild("DKey"))
	end

	if input.KeyCode == Enum.KeyCode.Space then
		onKey(keystrokes:WaitForChild("Spacebar"))
	end

	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		onKey(keystrokes:WaitForChild("LMB"))
	end

	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		onKey(keystrokes:WaitForChild("RMB"))
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.W then
		offKey(keystrokes:WaitForChild("WKey"))
	end

	if input.KeyCode == Enum.KeyCode.A then
		offKey(keystrokes:WaitForChild("AKey"))
	end

	if input.KeyCode == Enum.KeyCode.S then
		offKey(keystrokes:WaitForChild("SKey"))
	end

	if input.KeyCode == Enum.KeyCode.D then
		offKey(keystrokes:WaitForChild("DKey"))
	end

	if input.KeyCode == Enum.KeyCode.Space then
		offKey(keystrokes:WaitForChild("Spacebar"))
	end

	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		offKey(keystrokes:WaitForChild("LMB"))
	end

	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		offKey(keystrokes:WaitForChild("RMB"))
	end
end)

task.spawn(function()
	while wait(1) do
		if timeUntilIdle > 0 then
			timeUntilIdle = timeUntilIdle - 1
		end
	end
end)

task.spawn(function()
	while wait(1) do
		if timeUntilIdle == 0 and LunarHub:WaitForChild("Idle").Visible == false then
			openIdle()
		end
	end
end)

LunarHub.Taskbar.FirstTime.Visible = true
HomeUI.FirstTime.Visible = true
LunarHub.Taskbar.FirstTime.Text = "TAP '" .. string.sub(tostring(LunarHubSettings.TaskbarKeybind), 14) .. "' TO OPEN/CLOSE"
LunarHub.Taskbar.FirstTime.TextColor3 = Color3.fromRGB(200,200,200)
HomeUI.FirstTime.Text = "TAP '" .. string.sub(tostring(LunarHubSettings.HomeKeybind), 14) .. "' TO OPEN/CLOSE"
HomeUI.FirstTime.TextColor3 = Color3.fromRGB(225,225,225)
HomeUI.FirstTime.AnchorPoint = Vector2.new(0.5,0)
HomeUI.FirstTime.Position = UDim2.new(0.5,0,HomeUI.FirstTime.Position.Y.Scale, HomeUI.FirstTime.Position.Y.Offset)
HomeUI.FirstTime.TextXAlignment = Enum.TextXAlignment.Center

if _G.LunarHubDebugMode == true then
	notifyUser("HomeKey: " .. tostring(LunarHubSettings.HomeKeybind), true)
	notifyUser("TaskKey: " .. tostring(LunarHubSettings.TaskbarKeybind), true)

	if _G.OverrideSettings then
		LunarHubSettings = _G.OverrideSettings
	end
end

LunarHub:WaitForChild("Home"):WaitForChild("Shutdown"):WaitForChild("Interact").MouseButton1Click:Connect(function()
	for i, v in pairs(LunarHub:GetChildren()) do
		if v.Name ~= "DestroyScreen" and v.Name ~= "LunarLogo" then
			v:Destroy()
		end
	end

	if game:GetService("Lighting"):FindFirstChild("ProjectLunarBlur") then
		game.Lighting:WaitForChild("ProjectLunarBlur"):Destroy()
	end

	local cam = game.Workspace.CurrentCamera or game.Workspace.Camera or game.Workspace:FindFirstChildWhichIsA("Camera")

	if cam then cam.FieldOfView = 70 else warn("LunarHub // Could not find camera!") end

	TS:Create(LunarLogo, LongTweenInfo, {Size = UDim2.new(0.5,0,0.5,0)}):Play()
	TS:Create(LunarLogo, LongTweenInfo, {ImageColor3 = Color3.fromRGB(170,221,255)}):Play()
	TS:Create(LunarLogo, LongTweenInfo, {ImageTransparency = 0}):Play()
	LunarHub:WaitForChild("DestroyScreen").Visible = true

	wait(5)

	LunarHub:Destroy()

	return
end)

--[[ executor system ]]--

notifyUser("Loading LunarExecutor...", true)

local LunarExecutorAPI = game:HttpGet("https://raw.githubusercontent.com/probablYnicKxD/ProjectLunar/main/LunarHub/LunarExecutor/API.lua")

local exec = LunarHub:WaitForChild("Executor")

--NOTICE! this monaco was NOT made by me/probablYnicK!

local monaco = loadstring(game:HttpGet("https://raw.githubusercontent.com/probablYnicKxD/ProjectLunar/main/LunarHub/LunarExecutor/Monaco/main.lua"))()
monaco = monaco.new(exec:WaitForChild("Editor", 20))

monaco:SetText("--LunarExecutor functions by probablYnicK \n --Monaco/Syntax Highlighting made by sleitnick and bread!")

UIS.InputBegan:Connect(function(input)
	if UIS:IsKeyDown(Enum.KeyCode.LeftControl) and input.KeyCode == Enum.KeyCode.Q then
		exec.Visible = not exec.Visible
	end
end)

exec:WaitForChild("Clear").MouseButton1Click:Connect(function()
	monaco:SetText("")
end)

local openfile = exec.Clear:Clone()
openfile.Position = UDim2.new(exec.Clear.Position.X.Scale, exec.Clear.Position.X.Offset + (exec.Clear.Position.X.Offset - exec.Execute.Position.X.Offset), exec.Clear.Position.Y.Scale, exec.Clear.Position.Y.Offset)
openfile.Text = "OPEN FILE"
openfile.MouseButton1Click:Connect(function()
	local prompt = LunarHub:WaitForChild("OpenFile", 2)
	local otherprompt = LunarHub:WaitForChild("SaveFile", 2)

	if prompt then
		TS:Create(prompt, SecondaryTweenInfo, {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
		TS:Create(otherprompt, SecondaryTweenInfo, {Position = UDim2.new(0.5, 0, 1.5, 0)}):Play()
	else
		notifyUser("Failed to open Open File prompt!", false)
	end
end)
openfile.Parent = exec

local savefile = openfile:Clone()
savefile.Position = UDim2.new(openfile.Position.X.Scale, openfile.Position.X.Offset + (exec.Clear.Position.X.Offset - exec.Execute.Position.X.Offset), openfile.Position.Y.Scale, openfile.Position.Y.Offset)
savefile.Text = "SAVE FILE"
savefile.MouseButton1Click:Connect(function()
	if not isfolder("LunarExecutor Saved Scripts") then makefolder("LunarExecutor Saved Scripts") end

	local prompt = LunarHub:WaitForChild("SaveFile", 2)
	local otherprompt = LunarHub:WaitForChild("OpenFile", 2)

	if prompt then
		TS:Create(prompt, SecondaryTweenInfo, {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
		TS:Create(otherprompt, SecondaryTweenInfo, {Position = UDim2.new(0.5, 0, 1.5, 0)}):Play()
	else
		notifyUser("Failed to open Save File prompt!", false)
	end
end)
savefile.Parent = exec

exec:WaitForChild("Execute").MouseButton1Click:Connect(function()
	local success, err = pcall(function()
		loadstring(LunarExecutorAPI .. "; " .. monaco:GetText())()
	end)

	if success then
		notifyUser("Successfully executed script from LunarExecutor!", true)
	elseif not success and err then
		notifyUser("Failed to execute script from LunarExecutor - Error message shown in Dev Console [F9]!", false)
		error("LunarExecutor - Failed to execute script - Error Message:\n" .. err)
	end
end)

exec:WaitForChild("Close").MouseButton1Click:Connect(function()
	exec.Visible = false
end)

TaskbarUI:WaitForChild("Buttons"):WaitForChild("Executor"):WaitForChild("Interact").MouseButton1Click:Connect(function()
	exec.Position = UDim2.new(0.5,0,0.5,0)
	exec.Visible = not exec.Visible
end)

--[[ save and open file ]]--

local sfprompt = LunarHub:WaitForChild("SaveFile", 20)
local ofprompt = LunarHub:WaitForChild("OpenFile", 20)

sfprompt:WaitForChild("Layer"):WaitForChild("Save").MouseButton1Click:Connect(function()
	local savefilenameinput = sfprompt.Layer.Input

	if savefilenameinput.Text == "" then
		notifyUser("You must input a file name!", false)
		return
	end

	writefile("LunarExecutor Saved Scripts/" .. savefilenameinput.Text, monaco:GetText())
	notifyUser("Saved script to " .. UserExecutor .. "/workspace/LunarExecutor Saved Scripts/" .. savefilenameinput.Text .. "!", true)
end)

sfprompt:WaitForChild("Layer"):WaitForChild("Close").MouseButton1Click:Connect(function()
	TS:Create(sfprompt, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.5,0)}):Play()
end)

ofprompt:WaitForChild("Layer"):WaitForChild("Close").MouseButton1Click:Connect(function()
	TS:Create(ofprompt, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.5,0)}):Play()
end)

ofprompt:WaitForChild("Layer"):WaitForChild("Open").MouseButton1Click:Connect(function()
	local openfilenameinput = ofprompt.Layer.Input

	if openfilenameinput.Text == "" then
		notifyUser("You must input a file name!", false)
		return
	end

	local filefound = isfile(openfilenameinput.Text)
	if not filefound then
		notifyUser("Failed to open file - Could not find " .. openfilenameinput.Text .. " in your executor's workspace folder!", false)
		return
	else
		local filecontents = readfile(openfilenameinput.Text)
		if filecontents then
			local s, e = pcall(function()
				monaco:SetText(tostring(filecontents))
			end)

			if s then
				notifyUser("Successfully opened " .. openfilenameinput.Text .. "!", true)
			elseif not s and e then
				notifyUser("Failed to open " .. openfilenameinput.Text .. " - Error Message shown in Dev Console [F9]", false)
				warn("LunarHub - LunarExecutor // Failed to open " .. openfilenameinput.Text .. " - Error Message:\n" .. e)
			end
		end
	end
end)

--[[ Dragging ]]--

--LunarExecutor

task.spawn(function()
	local dragToggle = nil
	local dragSpeed = 0.1
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		exec:TweenPosition(position,"Out","Quad",dragSpeed, true)
	end

	exec.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = exec.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end)

notifyUser("Loaded LunarExecutor!", true)

--Keystrokes

task.spawn(function()
	local dragToggle = nil
	local dragSpeed = 0.1
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		keystrokes:TweenPosition(position,"Out","Quad",dragSpeed, true)
	end

	keystrokes.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = keystrokes.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end)

game.Players.PlayerRemoving:Connect(function(plr)
	if plr == game.Players.LocalPlayer then
		for _, v in next, listfiles("") do
			if string.find(v, "customInstance") then
				delfile(v)
			end
		end
	end
end)

print("LunarHub // Loaded LunarHub " .. LunarHubVersion .. " in " .. os.time() - bootTime .. " seconds")
