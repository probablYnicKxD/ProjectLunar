--[[

  	LunarHub - Version 0.1.0 Beta
  
  	Made by probablYnicK
  
  	UI design inspired by shlexware's design of Sirius and DomainX!

]]--

--[[ Services ]]--

local bootTime = os.time()

if _G.LunarHubExecuted == true then
	warn("LunarHub // LunarHub is already executed!")
	return
end

local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local RS = game:GetService("ReplicatedStorage")

local LunarHubVersion = "v0.1.0 Beta"

local latest = game:HttpGet("https://raw.githubusercontent.com/probablYnicKxD/ProjectLunar/main/LunarHub/latestversion")

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
	2.5,
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
	BlurEnabled = false,
	TimeFormat = 12,
	ShowSeconds = false,
}

local LunarHubThemes = {
	DARK = {},
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
	elseif game.Players:GetPlayerByUserId(id).OsPlatform == "LunarHub" then
		return "Project Lunar User"
	else
		return "Non-Project Lunar User"
	end
end

game.Players.LocalPlayer.OsPlatform = "LunarHub"

local LunarHub = game:GetObjects("rbxassetid://11520374479")[1]

wait(2)

--[[ UIs ]]--

local Blur = LunarHub.ProjectLunarBlur
local NotificationUI = LunarHub.Notifications
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

local scriptsOpen = false
local taskbarOpen = false

local function openHome()
	if LunarHub.Scripts.Position == UDim2.new(0.5,0,1,-90) then
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

	if LunarHubSettings.BlurEnabled then
		Blur.Parent = game:GetService("Lighting")

		Blur.Enabled = true

		local bluropen = TS:Create(Blur, SecondaryTweenInfo, {Size = 10})
		bluropen:Play()
	end

	local success,errMsg = pcall(function()
		local camera = game.Workspace.CurrentCamera or game.Workspace.Camera or game.Workspace:FindFirstChildWhichIsA("Camera")

		if camera then
			TS:Create(camera, SecondaryTweenInfo, {FieldOfView = 40}):Play()
		end
	end)

	if not success and errMsg then
		warn("LunarHub // Failed to do task: ProjectLunarTask_HomeZoomIn - Error Message:\n" .. errMsg)
	end
end

local function closeHome()
	if scriptsOpen then
		TS:Create(LunarHub.Scripts, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1,-90)}):Play()
	end

	if taskbarOpen then
		TS:Create(LunarHub.Taskbar, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1,-12)}):Play()
	end

	TS:Create(LunarHub.DarkBG, SecondaryTweenInfo, {BackgroundTransparency = 1}):Play()
	TS:Create(HomeUI, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,-0.5,0)}):Play()

	if LunarHubSettings.BlurEnabled then
		Blur.Parent = game:GetService("Lighting")

		Blur.Enabled = true

		local blurclose = TS:Create(Blur, SecondaryTweenInfo, {Size = 0})
		blurclose:Play()
	end

	local success,errMsg = pcall(function()
		local camera = game.Workspace.CurrentCamera or game.Workspace.Camera or game.Workspace:FindFirstChildWhichIsA("Camera")

		if camera then
			TS:Create(camera, SecondaryTweenInfo, {FieldOfView = 70}):Play()
		end
	end)

	if not success and errMsg then
		warn("LunarHub // Failed to do task: ProjectLunarTask_HomeZoomOut - Error Message:\n" .. errMsg)
	end
end

local function toggleHome()
	if HomeUI.Position == UDim2.new(0.5,0,0.5,0) then
		closeHome()
	else
		openHome()
	end
end

local lltween = TS:Create(LunarLogo, NormalTweenInfo, {ImageTransparency = 0})
lltween:Play()
lltween.Completed:Wait()

local lltween2 = TS:Create(LunarLogo, NormalTweenInfo, {ImageColor3 = Color3.fromRGB(0,0,0)})
lltween2:Play()
lltween2.Completed:Wait()

local lltween3 = TS:Create(LunarLogo, LongTweenInfo, {ImageTransparency = 0.7, Size = UDim2.new(10,0,10,0)})
lltween3:Play()

openHome()

--[[ Utility Functions ]]--

local function notifyUser(msg, success, notiTime)
	local template = NotificationUI.Template
	
	local new = template:Clone()
	
	new.Name = "Notification"
	
	new.NotificationText.Text = msg
	
	if success == nil then
		new.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 90, 90)), ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 26, 26))})
	end

	if success == true then
		new.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 200, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 0))})
	end

	if success == false then
		new.Gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(209, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(113, 0, 0))})
	end
	
	new.Visible = true
	
	local notificationTime = notiTime or 7.5
	
	wait(notificationTime)
	
	TS:Create(new, NormalTweenInfo, {BackgroundTransparency = 1}):Play()
	TS:Create(new.NotificationText, NormalTweenInfo, {TextTransparency = 1}):Play()
end

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

local UserExecutor = identifyexecutor() or "Unknown"

if syn then
	UserExecutor = "Synapse X"
end

if UserExecutor == "Unknown" then
	notifyUser("Detected executor: " .. UserExecutor, false)
else
	notifyUser("Detected executor: " .. UserExecutor, true)
end

--[[ Configurations ]]--

local ConfigFolderName = "LunarHub Configurations"
local CustomFolderName = "LunarHub Custom Scripts"
local ThemesFolderName = "LunarHub Themes"
local ConfigFileName = "LunarHub_Configs"
local ThemesFileName = "LunarHub_Themes"

local firstTime = false

--Protection--

if syn.protect_gui then
	syn.protect_gui(LunarHub)
	LunarHub.Parent = game:GetService("CoreGui")
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

local function loadConfiguration()
	notifyUser("Loading settings...", true)
	for i, file in ipairs(listfiles(ConfigFolderName)) do
		local configFile = game:GetService("HttpService"):JSONDecode(readfile(file))

		LunarHubSettings = {
			Theme = configFile.Theme,
			TaskbarKeybind = configFile.TaskbarKeybind,
			HomeKeybind = configFile.HomeKeybind,
			BlurEnabled = configFile.BlurEnabled,
			TimeFormat = configFile.TimeFormat,
			ShowSeconds = configFile.ShowSeconds,
		}
		
		local set = SettingsUI.Settings
		
		local function keybindToString(k)
			return string.sub(tostring(k), 14)
		end
		
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
		
		set.HomeKeybind.KeybindFrame.CurrentBind.Text = keybindToString(configFile.HomeKeybind)
		set.TaskbarKeybind.KeybindFrame.CurrentBind.Text = keybindToString(configFile.TaskbarKeybind)
		set.BlurToggle.Icon.ImageColor3 = toggleToColor(configFile.BlurEnabled)
		set.TimeToggle.Icon.ImageColor3 = toggleToColor(numToToggle(configFile.TimeFormat))
		set.SecondsToggle.Icon.ImageColor3 = toggleToColor(configFile.ShowSeconds)
	end
	notifyUser("Successfully loaded settings!", true)
end

local function loadcustomscripts()
	notifyUser("Loading custom scripts...", true)
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
	notifyUser("Successfully loaded your custom scripts!", true)
end

if checkFunctions() == true then
	if isfolder(CustomFolderName) then
		loadcustomscripts()
		firstTime = false
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
		firstTime = false
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
	
	local tJSON = game:GetService("HttpService"):JSONEncode(newSettings)
	local success, errMsg = pcall(function()
		writefile(ConfigFolderName .. "/" .. ConfigFileName, tJSON)
	end)

	if success then
		notifyUser("Successfully saved settings!", true)
	elseif not success and errMsg then
		notifyUser("Failed to save settings! Error message shown in Developer Console. [F9]", false)
	end
end

local function createTheme(name, main, accent, secondary)
	if checkFunctions() == false then return end
	
	local success,errMsg = pcall(function()
		LunarHubThemes[name] = {
			Main = main,
			Accent = accent,
			Secondary = secondary
		}
		
		writefile()
	end)

	if success then
		
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

local list = PlayerlistUI.Interactions.List

local function refreshPlayerList()
	for i, already in pairs(list:GetChildren()) do
		if already.Name ~= "UIListLayout" and already.Name ~= "Placeholder" and already.Name ~= "Template" then
			already:Destroy()
		end
	end

	local template = list.Template

	for i, plr in pairs(Players) do
		local new = template:Clone()

		template.Name = plr.UserId
		template.DisplayName.Text = plr.DisplayName
		template.Username.Text = "@" .. plr.Name
		template.Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(plr.UserId) .. "&w=420&h=420"

		if plr:FindFirstChild("UsingLunar") then
			if plr:WaitForChild("UsingLunar").Value == true then
				template.UsingLunar.Visible = true
			end
		end

		if game.Players.LocalPlayer:IsFriendsWith(plr.UserId) then
			template.IsFriend.Visible = true
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

task.spawn(function()
	while wait() do
		local fps = game:GetService("Workspace"):GetRealPhysicsFPS()
		fpsCounter.Info.Text = tostring(fps) .. " FPS"
	end
end)

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

serverInfo.Players.Info.Text = tostring(#game.Players:GetPlayers()) .. "/" .. game.Players.MaxPlayers
serverInfo.LunarPlayers.Text = tostring(#lunaruserstable) .. " Lunar Users are playing right now"

local function updateServerPlayers()
	lunaruserstable = getlunarusers()

	serverInfo.Players.Info.Text = tostring(#game.Players:GetPlayers()) .. "/" .. game.Players.MaxPlayers .. " Players"
	serverInfo.LunarPlayers.Text = tostring(#lunaruserstable) .. " Lunar Users are playing right now"
end

game.Players.PlayerAdded:Connect(function()
	wait()
	updateServerPlayers()
end)

game.Players.PlayerRemoving:Connect(function()
	updateServerPlayers()
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
end

local timeElapsedUI = inter.TimeElapsed

timeElapsedUI.Subtitle = "You've been playing " .. game.Name .. " for"

task.spawn(function()
	if getTimeSinceBoot("min") == 0 then
		timeElapsedUI.Time.Text = tostring(getTimeSinceBoot("sec")) .. " seconds"
	elseif getTimeSinceBoot("min") > 60 then
		timeElapsedUI.Time.Text = tostring(getTimeSinceBoot("hour")) .. " hours"
	else
		timeElapsedUI.Time.Text = tostring(getTimeSinceBoot("min")) .. " minutes"
	end

	local date,dateMsg,hour = getDate()

	HomeUI.Title.Text = dateMsg
	HomeUI.Subtitle.Text = msgToSub(hour)

	HomeUI.CurrentTime.Info.Text = date

	LunarHub.Taskbar.Time.Text = date
end)

HomeUI.Interactions.Information.ExecutorName.Text = UserExecutor
HomeUI.Interactions.Information.Version.Text = LunarHubVersion

if LunarHubVersion ~= latest then
	HomeUI.Interactions.Information.NewerVersionAvailable.Visible = true
end

local function refreshFriendsList()
	for i, already in pairs(HomeUI.Interactions.Friends.List:GetChildren()) do
		if already.Name ~= "UIListLayout" and already.Name ~= "Template" then
			already:Destroy()
		end
	end

	for i, p in pairs(Players) do
		if game.Players.LocalPlayer:IsFriendsWith(p.UserId) then
			local template = HomeUI.Interactions.Friends.List.Template

			local new = template:Clone()

			new.Avatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. p.UserId .. "&w=420&h=420"
			new.DisplayName.Text = p.DisplayName
			new.ProjectLunarStatus.Text = getStatus(p.UserId)
			new.Username.Text = p.Name
			new.Name = p.Name
		end
	end
end

refreshFriendsList()

game.Players.PlayerAdded:Connect(refreshFriendsList())
game.Players.PlayerRemoving:Connect(refreshFriendsList())

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
		new.Name = libraryScript.Name
		new.ScriptName.Text = libraryScript.Name
		new.ScriptDescription.Text = libraryScript.Description
		new.ScriptAuthor.Text = "created by " .. libraryScript.Creator

		if libraryScript.Universal == true then
			new.Universal.Visible = true
		end

		if libraryScript.KeySys == true then
			new.KeySystem.Visible = true
		end

		new.Execute.MouseButton1Click:Connect(function()
			loadstring(libraryScript.LoadstringScript)()
		end)

		if #libraryScript.Games == 1 then
			new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. libraryScript.Games[1] .. "&w=150&h=150"
		elseif #libraryScript.Games >= 2 then
			local gameThumbnail = table.find(libraryScript.Games, game.PlaceId)

			if gameThumbnail then
				new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. game.PlaceId .. "&w=150&h=150"
			else
				local randomThumbnail = math.random(1,#libraryScript.Games)

				local randomGameID = libraryScript.Games[randomThumbnail]

				if randomGameID then
					new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. randomGameID .. "&w=150&h=150"
				end
			end
		elseif #libraryScript.Games == 0 and libraryScript.Universal == true then
			new.GameThumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. game.PlaceId .. "&w=768&h=432"
		else
			new.GameThumbnail.Image = ""
		end

		new.Visible = true
	end
end

local function refreshCustomLibrary()
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

		if customScr.Games == "UNIVERSAL" then
			new.Universal.Visible = true
		end

		new.Execute.MouseButton1Click:Connect(function()
			loadstring(customScr.LoadstringScript)()
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
		if scr.Universal == false and table.find(scr.Games, gameID) then
			table.insert(possibleScripts, scr)
		end
	end

	if #possibleScripts == 1 and _script == nil then
		_script = possibleScripts[1]
		return _script
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
		if table.find(scr.Games, game.PlaceId) or scr.Universal == true then
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

	return lockedBestScript or bestScript
end

refreshScriptLibrary()

LunarHub.ScriptSearch.Refresh.Interact.MouseButton1Click:Connect(refreshScriptLibrary())
LunarHub.CustomScripts.Refresh.Interact.MouseButton1Click:Connect(refreshCustomLibrary())

--[[ Searching ]]--

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
	if checkFunctions() == false then
		notifyUser("Failed to make custom script - Your executor does not support file saving!", false)
		return
	end
	
	local gamesTable = "UNIVERSAL"
	
	if games ~= "UNIVERSAL" then
		games = string.gsub(games, " ", "")
		
		gamesTable = string.split(games, ",")
	else
		gamesTable = "UNIVERSAL"
	end

	local newTable = {
		Name = name,
		Description = desc,
		Games = gamesTable,
		LoadstringScript = loadstr
	}

	local httpService = game:GetService("HttpService")
	local _tJSON = httpService:JSONEncode(newTable)

	local newScript = writefile(CustomFolderName .. "/" .. name .. ".lua", _tJSON)
	notifyUser("Successfully created custom script: " .. name .. "!", true)
	
	refreshCustomLibrary()
end

LunarHub.ScriptSearch.SearchBox:GetPropertyChangedSignal("Text"):Connect(searchScripts())
LunarHub.CustomScripts.SearchBox:GetPropertyChangedSignal("Text"):Connect(searchCustomScripts())

local function promptGameDetection()
	local bestScript = detectBestScriptForGame()

	local ui = LunarHub.GameDetection

	local _tween = TS:Create(ui, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,0.25,0)})
	_tween:Play()

	ui.Thumbnail.Image = "rbxthumb://type=GameThumbnail&id=" .. game.PlaceId .. "&w=768&h=432"
	
	if bestScript.Universal == true then
		ui.Layer.Subtitle.Text = "LunarHub couldn't find a script for " .. game.Name .. ", but we found a universal script you might like! Press Execute or tap 'Y' on your keyboard to execute it!"
	else
		ui.Layer.Subtitle.Text = "LunarHub has a script for " .. game.Name .. "! Press Execute or tap 'Y' on your keyboard to execute it!"
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

	ui.Layer.Execute.MouseButton1Click:Connect(function()
		executeScript()
	end)

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
	ui.Prompt.Text = "LunarHub found a script for " .. game.Name .. ". Tap to re-open the prompt."

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

if firstTime == true then
	local taskKey = string.sub(tostring(LunarHubSettings.TaskbarKeybind), 14)
	local homeKey = string.sub(tostring(LunarHubSettings.HomeKeybind), 14)

	LunarHub.Taskbar.FirstTime.Visible = true
	HomeUI.FirstTime.Visible = true
	LunarHub.Taskbar.FirstTime.Text = "TAP '" .. taskKey .. "' TO OPEN/CLOSE"
	HomeUI.FirstTime.Text = "TAP '" .. homeKey .. "' TO OPEN/CLOSE"
else
	LunarHub.Taskbar.FirstTime.Visible = false
	HomeUI.FirstTime.Visible = false
end

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

UIS.InputBegan:Connect(function(input)
	if input.KeyCode == LunarHubSettings.HomeKeybind then
		toggleHome()
	elseif input.KeyCode == LunarHubSettings.TaskbarKeybind then
		toggleTaskbar()
	end
end)

local customScriptCooldown = false

LunarHub.CustomScriptCreator.CreateScript.Interact.MouseButton1Click:Connect(function()
	if customScriptCooldown == true then notifyUser("Please wait a few more seconds before creating another custom script!", false) return end
	
	local ui = LunarHub.CustomScriptCreator
	
	if ui.NameInput.Text == "" then
		notifyUser("Please enter a name for the custom script!", false)
		return
	end
	
	if ui.GamesInput.Text == "" then
		notifyUser("Please a valid game list or type \"UNIVERSAL\" into the textbox if your script is universal!", false)
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

TaskbarUI.Buttons.Settings.Interact.MouseButton1Click:Connect(function()
	TS:Create(SettingsUI, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,0.5,0)}):Play()
	
	SettingsUI.Close.MouseButton1Click:Connect(function()
		TS:Create(SettingsUI, SecondaryTweenInfo, {Position = UDim2.new(0.5,0,1.5,0)}):Play()
	end)
end)

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
		BlurEnabled = false,
		TimeFormat = 12,
		ShowSeconds = false,
	}
	
	newSettings.BlurEnabled = getToggleValue(sui.BlurToggle)
	newSettings.ShowSeconds = getToggleValue(sui.SecondsToggle)
	
	local tf = getToggleValue(sui.TimeToggle)
	
	if tf == true then
		newSettings.TimeFormat = 24
	else
		newSettings.TimeFormat = 12
	end
	
	newSettings.TaskbarKeybind = Enum.KeyCode[sui.TaskbarKeybind.KeybindFrame.CurrentBind.Text]
	newSettings.HomeKeybind = Enum.KeyCode[sui.HomeKeybind.KeybindFrame.CurrentBind.Text]
	
	newSettings.Theme = ThemeUI.SelectedTheme.Value
	
	return newSettings
end

sui.SecondsToggle.Interact.MouseButton1Click:Connect(function()
	local newVal = toggleToggle()

	LunarHubSettings.ShowSeconds = newVal
	writesettings(getSettings())
end)

sui.BlurToggle.Interact.MouseButton1Click:Connect(function()
	local newVal = toggleToggle()

	LunarHubSettings.BlurEnabled = newVal
	writesettings(getSettings())
end)

sui.TimeToggle.Interact.MouseButton1Click:Connect(function()
	local newVal = toggleToggle()

	if newVal == true then
		LunarHubSettings.TimeFormat = 24
	else
		LunarHubSettings.TimeFormat = 12
	end
	
	writesettings(getSettings())
end)

sui.HomeKeybind.Interact.MouseButton1Click:Connect(function()
	sui.HomeKeybind.KeybindFrame.CurrentBind.Text = "Press Key"
end)

sui.TaskbarKeybind.Interact.MouseButton1Click:Connect(function()
	sui.TaskbarKeybind.KeybindFrame.CurrentBind.Text = "Press Key"
end)

UIS.InputBegan:Connect(function(input)
	if sui.HomeKeybind.KeybindFrame.CurrentBind.Text == "Press Key" then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			local keyStr = string.sub(tostring(input.KeyCode), 14)

			sui.HomeKeybind.KeybindFrame.CurrentBind.Text = keyStr

			LunarHubSettings.HomeKeybind = input.KeyCode

			writesettings(getSettings())
		end
	end
	
	if sui.TaskbarKeybind.KeybindFrame.CurrentBind.Text == "Press Key" then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			local keyStr = string.sub(tostring(input.KeyCode), 14)

			sui.TaskbarKeybind.KeybindFrame.CurrentBind.Text = keyStr

			LunarHubSettings.TaskbarKeybind = input.KeyCode

			writesettings(getSettings())
		end
	end
end)

print("LunarHub // Loaded LunarHub " .. LunarHubVersion .. " in " .. os.clock() .. " seconds")
_G.LunarHubExecuted = true
