--[[ please do not edit this or copy this, thanks! ]]--

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local lunarAPI = loadstring(game:HttpGet("https://raw.githubusercontent.com/probablYnicKxD/ProjectLunar/main/Lunar%20API.lua"))()

if game.PlaceId == 6516141723 then
    OrionLib:MakeNotification({
        Name = "WARNING!",
        Content = "Do NOT execute Lunar AI in the lobby as it could get you permanently banned!",
        Time = 30
    })
    return
end

local SECRETEDITION = false

local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart

local currentEntity = "None"

local libraryFigureSpawned = false
local escapeFigureSpawned = false

local correctKey = loadstring(game:HttpGet("https://raw.githubusercontent.com/coolusername17563245/coolrepo2/main/coolscript"))()

local keyInputTable = {
	InputtedKey = ""
}

local keyWindow = OrionLib:MakeWindow({Name = "Lunar AI // DOORS // Key System ", HidePremium = true, IntroEnabled = true, IntroText = "Lunar AI // DOORS // Key System"})

local keyTab = keyWindow:MakeTab({
	Name = "Key System",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local keyFileName = "LunarAIKey.txt"

local function loadKeyInput()
	print("Lunar AI // Loading key input...")
	
	local HttpService = game:GetService("HttpService")
	
	if (readfile and isfile) then
		if isfile(keyFileName) then
			keyInputTable = HttpService:JSONDecode(readfile(keyFileName))
		
			print("Lunar AI // Key System // Loaded key: " .. keyInputTable.InputtedKey)
			
			if keyInputTable.InputtedKey == correctKey then
				OrionLib:MakeNotification({
					Name = "Lunar AI // Key System",
					Content = "Correct key!",
					Image = "rbxassetid://4483345998",
					Time = 5
				})
			else
				OrionLib:MakeNotification({
					Name = "Lunar AI // Key System",
					Content = "Invalid key!",
					Image = "rbxassetid://4483345998",
					Time = 5
				})
			end
		end
	else
		OrionLib:MakeNotification({
			Name = "Lunar AI // Key System",
			Content = "Your key could not be loaded due to your executor not having the readfile()/isfile() function. Please use another executor if you would like your key to be loaded.",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	end
end

local function saveKeyInput()
	print("Lunar AI // Saving key input...")
	local json
	local HttpService = game:GetService("HttpService")
	
	if (writefile) then
		json = HttpService:JSONEncode(keyInputTable)
		writefile(keyFileName, json)
	else
		OrionLib:MakeNotification({
			Name = "Lunar AI // Key System",
			Content = "Your key could not be saved due to your executor not having the writefile() function. Please use another executor if you would like your key to be saved.",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	end
end

keyTab:AddButton({
	Name = "Get Key (DISCORD SERVER)",
	Callback = function()
		setclipboard("https://discord.gg/shcdVcSsQx")
			
		OrionLib:MakeNotification({
			Name = "Lunar AI // Key System",
			Content = "Copied discord invite!",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	end
})

keyTab:AddTextbox({
	Name = "Input Key",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		keyInputTable.InputtedKey = Value
	end	  
})

keyTab:AddButton({
	Name = "Submit Key",
	Callback = function()
		if keyInputTable.InputtedKey == correctKey then
			saveKeyInput()
			
			OrionLib:MakeNotification({
				Name = "Lunar AI // Key System",
				Content = "Correct key!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		else
			OrionLib:MakeNotification({
				Name = "Lunar AI // Key System",
				Content = "Invalid key!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end	
	end
})

loadKeyInput()

while wait() do
	if keyInputTable.InputtedKey == correctKey then
		wait(0.5)
		OrionLib:Destroy()
		break
	end
end

--[[

	Lunar AI 0.3.9-3 // Made by probablYnicK

]]--

local aiVersion = "0.3.9-3 "

local function getPlayerID()
    return game.Players.LocalPlayer.UserId
end

local playerID = getPlayerID()

local earlyAccess = {
    3648276896, --UndefinedVoid_0
    243999341, --IndyKien
    269521613, --BestDanTDM_FAN1
    1472117103, --Urbanwarrior667
    1511262630, --Maus773
    3974907880, --calamitydclelek [ Maus773 ALT ]
}

local lighting = game:GetService("Lighting")

local normalLightingSettings = {
	Brightness = lighting.Brightness,
	ClockTime = lighting.ClockTime,
	FogEnd = lighting.FogEnd,
	GlobalShadows = lighting.GlobalShadows,
	Ambient = lighting.Ambient
}

local preAlphaTester = 2200660682

if playerID == 1038671897 then
    aiVersion = aiVersion .. "Developer Edition"
elseif table.find(earlyAccess, playerID) then
    aiVersion = aiVersion .. "Early Access"
elseif playerID == preAlphaTester then
    aiVersion = aiVersion .. "Pre-Alpha Tester Edition"
else
    aiVersion = aiVersion .. "Public Beta"
end

local lunarFolder = Instance.new("Folder", game.ReplicatedStorage)
lunarFolder.Name = "LunarValues"

local fullAI = Instance.new("BoolValue", lunarFolder)
fullAI.Name = "FullAI"
fullAI.Value = false

local HeadlightEnabledLunar = Instance.new("BoolValue", lunarFolder)
HeadlightEnabledLunar.Name = "HeadlightEnabled"
HeadlightEnabledLunar.Value = true

local HeadlightBrightnessLunar = Instance.new("NumberValue", lunarFolder)
HeadlightEnabledLunar.Name = "HeadlightBrightness"
HeadlightEnabledLunar.Value = 0.25

local key = Instance.new("StringValue", lunarFolder)
key.Name = "SprintKeybind"
key.Value = "Q"

local skipKey = Instance.new("StringValue", lunarFolder)
skipKey.Name = "SkipKeybind"
skipKey.Value = "R"

local tpKeyKey = Instance.new("StringValue", lunarFolder)
tpKeyKey.Name = "TPKeyKeybind"
tpKeyKey.Value = "T"

local fullAIKey = Instance.new("StringValue", lunarFolder)
fullAIKey.Name = "FullAIKeybind"
fullAIKey.Value = "G"

local hideKey = Instance.new("StringValue", lunarFolder)
hideKey.Name = "HideKeybind"
hideKey.Value = "H"

local completeLibraryKey = Instance.new("StringValue", lunarFolder)
completeLibraryKey.Name = "CompleteLibraryKeybind"
completeLibraryKey.Value = "B"

local healthKey = Instance.new("StringValue", lunarFolder)
healthKey.Name = "CheckHealthKeybind"
healthKey.Value = "V"

local fbKey = Instance.new("StringValue", lunarFolder)
fbKey.Name = "FullbrightKeybind"
fbKey.Value = "F"

local tipsEnabled = true

--[[ Entity Info GUI ]]--

local LunarUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local EntityInfo = Instance.new("Frame")
local EntityImage = Instance.new("ImageLabel")
local EntityName = Instance.new("TextLabel")
--[TEMPORARILY REMOVED] local EntityDistance = Instance.new("TextLabel")
local NextChase = Instance.new("TextLabel")
local RoomNumber = Instance.new("TextLabel")
local MusicInfo = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SongName = Instance.new("TextLabel")
local song = Instance.new("Sound")

LunarUI.Name = "LunarUI"
LunarUI.Parent = game.CoreGui
LunarUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = LunarUI
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 1.000
MainFrame.Size = UDim2.new(1, 0, 1, 0)

EntityInfo.Name = "EntityInfo"
EntityInfo.Parent = MainFrame
EntityInfo.AnchorPoint = Vector2.new(1, 1)
EntityInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EntityInfo.BackgroundTransparency = 1.000
EntityInfo.Position = UDim2.new(1, 0, 1, 0)
EntityInfo.Size = UDim2.new(0, 200, 0, 150)

EntityImage.Name = "EntityImage"
EntityImage.Parent = EntityInfo
EntityImage.AnchorPoint = Vector2.new(1, 1)
EntityImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EntityImage.BackgroundTransparency = 1.000
EntityImage.Position = UDim2.new(1, 0, 1, 0)
EntityImage.Size = UDim2.new(0, 100, 0, 100)
EntityImage.Image = "rbxassetid://403653614"
EntityImage.ScaleType = Enum.ScaleType.Fit

EntityName.Name = "EntityName"
EntityName.Parent = EntityInfo
EntityName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EntityName.BackgroundTransparency = 1.000
EntityName.Position = UDim2.new(0.5, 0, 0.166666672, 0)
EntityName.Size = UDim2.new(0.5, 0, -0.166666672, 50)
EntityName.Font = Enum.Font.Oswald
EntityName.Text = "N/A"
EntityName.TextColor3 = Color3.fromRGB(235, 218, 148)
EntityName.TextSize = 30.000

--[[
    TEMPORARILY REMOVED

    EntityDistance.Name = "EntityDistance"
    EntityDistance.Parent = EntityInfo
    EntityDistance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    EntityDistance.BackgroundTransparency = 1.000
    EntityDistance.Position = UDim2.new(0.5, 0, 0.0733333305, 0)
    EntityDistance.Size = UDim2.new(0.5, 0, -0.239999995, 50)
    EntityDistance.Font = Enum.Font.Oswald
    EntityDistance.Text = "N/A studs away"
    EntityDistance.TextColor3 = Color3.fromRGB(235, 218, 148)
    EntityDistance.TextSize = 15.000
    EntityDistance.TextWrapped = true
]]--

NextChase.Name = "NextChase"
NextChase.Parent = EntityInfo
NextChase.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NextChase.BackgroundTransparency = 1.000
NextChase.Position = UDim2.new(0, 0, 0.673333347, 0)
NextChase.Size = UDim2.new(0.5, 0, -0.25999999, 50)
NextChase.Font = Enum.Font.Oswald
NextChase.Text = "Next Chase:"
NextChase.TextColor3 = Color3.fromRGB(235, 218, 148)
NextChase.TextSize = 20.000

RoomNumber.Name = "RoomNumber"
RoomNumber.Parent = EntityInfo
RoomNumber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RoomNumber.BackgroundTransparency = 1.000
RoomNumber.Position = UDim2.new(0, 0, 0.746666729, 0)
RoomNumber.Size = UDim2.new(0.5, 0, -0.166666672, 50)
RoomNumber.Font = Enum.Font.Oswald
RoomNumber.Text = game:GetService("ReplicatedStorage"):WaitForChild("GameData"):WaitForChild("ChaseStart").Value
RoomNumber.TextColor3 = Color3.fromRGB(235, 218, 148)
RoomNumber.TextSize = 30.000

MusicInfo.Name = "MusicInfo"
MusicInfo.Parent = LunarUI
MusicInfo.AnchorPoint = Vector2.new(1, 1)
MusicInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MusicInfo.BackgroundTransparency = 1.000
MusicInfo.Position = UDim2.new(1, 0, 0.74727273, 0)
MusicInfo.Size = UDim2.new(0, 200, 0, 66)

Title.Name = "Title"
Title.Parent = MusicInfo
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(0, 200, 0, 35)
Title.Font = Enum.Font.Oswald
Title.Text = "Currently Playing: "
Title.TextColor3 = Color3.fromRGB(235, 218, 148)
Title.TextSize = 25.000

SongName.Name = "SongName"
SongName.Parent = MusicInfo
SongName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SongName.BackgroundTransparency = 1.000
SongName.Position = UDim2.new(0, 0, 0, 25)
SongName.Size = UDim2.new(0, 200, 0, 41)
SongName.Font = Enum.Font.Oswald
SongName.Text = "None"
SongName.TextColor3 = Color3.fromRGB(235, 218, 148)
SongName.TextSize = 20.000
SongName.TextWrapped = true

song.Parent = MusicInfo
song.Name = "LunarSong"
song.SoundId = 0
song.Looped = false
song.Volume = 1


local notificationSoundLunar = Instance.new("Sound", game.CoreGui)
notificationSoundLunar.Name = "LunarNotificationSound"
notificationSoundLunar.SoundId = "rbxassetid://5568992074"
notificationSoundLunar.Volume = 1

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- [[ End ]] --

local function FindFirstDescendant(name, ancestor)
    for i, obj in pairs(ancestor:GetDescendants()) do
        if obj.Name == name  then
            if obj:IsA("MeshPart") or obj:IsA("BasePart") or obj:IsA("Part") or obj:IsA("Model") then
                if obj:IsA("Model") then
                    try = obj:FindFirstChildWhichIsA("Part")

                    if try then return try end

                    try = obj:FindFirstChildWhichIsA("MeshPart")

                    if try then return try end

                    try = obj:FindFirstChildWhichIsA("BasePart")

                    if try then return try end
                end
                return obj
            end
        end
    end

    return nil
end

local function getEntity(name)
	local try = FindFirstDescendant(name .. "Ragdoll", game.Workspace)

	if try then return try end
	
	try = FindFirstDescendant(name, game.Workspace)

	if try then return try end

	try = FindFirstDescendant(name .. "Moving", game.Workspace)

	if try then return try end

	if name == "Halt" then
		try = FindFirstDescendant("Shade", game.Workspace)
    elseif name == "Eyes" then
        try = game:GetService("Workspace"):FindFirstChild("Lookman")
	end

	if try then return try end

	return nil
end

local function getEntityAction(entityName)
	if entityName == "Rush" then
		return "Hide"
	elseif entityName == "Ambush" then
		return "Hide"
	elseif entityName == "Seek" then
		return "Run"
	elseif entityName == "Figure" then
		return "Quiet"
	elseif entityName == "Halt" then
		return "Run"
	elseif entityName == "Eyes" then
		return "Look away"
	elseif entityName == "Screech" then
		return "Stare him down"
	end

	return "Hide"
end

local function returnDefinedMessage(msg, entityName, prediction)
	local returnMsg = string.gsub(msg, "{action}", getEntityAction(entityName))

	if entityName then
        returnMsg = string.gsub(returnMsg, "{entity}", entityName)
    end

	if ChaseStart.Value > 99 then
        returnMsg = string.gsub(returnMsg, "{roomsUntilEntity}", "100")
    else
        returnMsg = string.gsub(returnMsg, "{roomsUntilEntity}", tostring(ChaseStart.Value - LatestRoom.Value))
    end

	returnMsg = string.gsub(returnMsg, "{nextEntityRoom}", tostring(ChaseStart.Value))

	if prediction then
        returnMsg = string.gsub(returnMsg, "{prediction}", prediction)
    end

	return returnMsg
end

local incomingEntityMsg = "Careful! An entity will spawn in {roomsUntilEntity} rooms! (Room {nextEntityRoom})"
local entityIncomingInNextRoomMsg = "Careful! An entity will spawn in the next room! (Room {nextEntityRoom})"

local nextCommandMsg = "The next entity will spawn in Room {nextEntityRoom}."
local predictCommandMsg = "Predicted Entity: {prediction}"

local libraryMsg = "Shh! Figure spawned! Good luck, you're halfway there!"
local facilityMsg = "Shh! Figure spawned! Good luck, you're in the final room!"

local entitySpawnedMsg = "{action}! {entity} has spawned!"

local fbEnabled = false

local function notifyUser(title, text, overriddenTime, playSound)
    local notificationTitle = "Notification"
    local notificationText = "Notification Text"
    local notificationTime = 5
    local notificationSound = false

    if title then
        notificationTitle = title
    end

    if text then
        notificationText = text
    end

    if overriddenTime then
        notificationTime = overriddenTime
    end

    if playSound then
        notificationSound = playSound
    end

	if playSound then
        notificationSoundLunar:Play()
        OrionLib:MakeNotification({
            Name = notificationTitle,
            Content = notificationText,
            Image = "rbxassetid://4483345998",
            Time = notificationTime
        })
    else
        OrionLib:MakeNotification({
            Name = notificationTitle,
            Content = notificationText,
            Image = "rbxassetid://4483345998",
            Time = notificationTime
        })
    end
end

notifyUser("Loading GUI...", "Loading GUI!")

local mainWindow = OrionLib:MakeWindow({Name = "Lunar AI // DOORS // Version " .. aiVersion, HidePremium = true, SaveConfig = true, ConfigFolder = "LunarAIConfigs", IntroEnabled = true, IntroText = "Lunar AI // DOORS // Version " .. aiVersion})

local lunarTab = mainWindow:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local messagesTab = mainWindow:MakeTab({
	Name = "Messages",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local keybindsTab = mainWindow:MakeTab({
	Name = "Keybinds",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local summonTab = mainWindow:MakeTab({
	Name = "Summon",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local miscTab = mainWindow:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

lunarTab:AddToggle({
    Name = "Headlight",
    Default = true,
    Save = true,
    Flag = "HeadlightEnabled",
    Callback = function(value)
        HeadlightEnabledLunar.Value = value
    end
})

lunarTab:AddSlider({
	Name = "Headlight Brightness",
	Min = 0,
	Max = 10,
	Default = 0.1,
	Color = Color3.fromRGB(170,221,255),
	Increment = 0.1,
	ValueName = "",
    Flag = "HeadlightBrightness",
    Save = true,
	Callback = function(Value)
		HeadlightBrightnessLunar.Value = Value
	end
})

lunarTab:AddSlider({
	Name = "FullBright Intensity",
	Min = 0.1,
	Max = 10,
	Default = 5,
	Color = Color3.fromRGB(170,221,255),
	Increment = 0.1,
	ValueName = "",
    Flag = "FullbrightIntensity",
    Save = true,
	Callback = function(Value)
		
	end
})

lunarTab:AddToggle({
	Name = "Tips",
	Default = true,
	Flag = "LunarTipsEnabled",
    Save = true,
    Callback = function(value)
        tipsEnabled = value
    end
})

lunarTab:AddSlider({
	Name = "Sprint Speed",
	Min = 0,
	Max = 100,
	Default = 50,
	Color = Color3.fromRGB(170,221,255),
	Increment = 1,
	ValueName = "studs/second",
    Flag = "SprintSpeedLunar",
    Save = true,
	Callback = function(Value)
		print("Sprint Speed set to " .. Value)
	end
})

lunarTab:AddSlider({
	Name = "Avoid Rush/Ambush Height",
	Min = 20,
	Max = 150,
	Default = 60,
	Color = Color3.fromRGB(170,221,255),
	Increment = 1,
	ValueName = "studs high",
    Flag = "AvoidHeightLunar",
    Save = true,
	Callback = function(Value)
		print("Avoid Height set to " .. Value)
	end
})

lunarTab:AddToggle({
	Name = "Skip Seek Chases",
	Default = false,
	Flag = "SkipSeekLunar",
    Save = true,
    Callback = function(value)
        
    end
})

lunarTab:AddToggle({
	Name = "Remove Seek Obstructions",
	Default = false,
	Flag = "RemoveObstructionsLunar",
    Save = true,
    Callback = function(value)
        
    end
})

lunarTab:AddToggle({
	Name = "Avoid Rush/Ambush",
	Default = false,
	Flag = "AutoHideLunar",
    Save = true,
    Callback = function(value)
        
    end
})

lunarTab:AddToggle({
	Name = "Secret Edition",
	Default = false,
	Flag = "SecretEditionLunar",
    Save = true,
    Callback = function(value)
        SECRETEDITION = value
        
        wait(0.01)

        if SECRETEDITION == false then
            notifyUser("Lunar AI", "Secret Edition was disabled!")
        elseif SECRETEDITION == true then
            notifyUser("Lunar AI", "Secret Edition was enabled!")
        end
    end
})

lunarTab:AddToggle({
	Name = "Remove Useless Assets",
	Default = false,
	Flag = "RemoveAssets",
    Save = true,
    Callback = function(value)
        
    end
})

lunarTab:AddToggle({
	Name = "Auto-Open Drawers",
	Default = false,
	Flag = "AutoDrawersLunar",
    Save = true,
    Callback = function(value)
        
    end
})

game:GetService("ProximityPromptService").PromptShown:Connect(function(prompt)
	if OrionLib.Flags["AutoDrawersLunar"].Value == true and prompt.Name == "ActivateEventPrompt" and prompt.Parent.Name == "Knobs" then
		fireproximityprompt(prompt, 0)
	end
end)

lunarTab:AddButton({
	Name = "Complete Elevator Breaker Box Minigame",
	Callback = function()
        game:GetService("ReplicatedStorage").Bricks.EBF:FireServer()
  	end    
})

lunarTab:AddButton({
	Name = "Remove Jumpscares",
	Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy()
            
            notifyUser("Success!", "Successfully removed jumpscares!")
        end)
  	end    
})

-- [[ KEYBINDS ]] --

keybindsTab:AddBind({
	Name = "Skip Room",
	Default = Enum.KeyCode.R,
	Hold = false,
    Flag = "SkipRoomKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        skipKey.Value = OrionLib.Flags["SkipRoomKeybind"].Value
        print("Skip Keybind is now: " .. tostring(skipKey.Value))
	end,
})

keybindsTab:AddBind({
	Name = "Teleport to Key",
	Default = Enum.KeyCode.T,
	Hold = false,
    Flag = "TpKeyKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        tpKeyKey.Value = OrionLib.Flags["TpKeyKeybind"].Value
        print("Teleport To Key Keybind is now: " .. tostring(tpKeyKey.Value))
	end,
})

keybindsTab:AddBind({
	Name = "Full AI",
	Default = Enum.KeyCode.G,
	Hold = false,
    Flag = "FullAIKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        fullAIKey.Value = OrionLib.Flags["FullAIKeybind"].Value
        print("Full AI Keybind is now: " .. tostring(fullAIKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Sprint",
	Default = Enum.KeyCode.Q,
	Hold = false,
    Flag = "SprintKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        key.Value = OrionLib.Flags["SprintKeybind"].Value
        print("Sprint Keybind is now: " .. tostring(key.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Hide",
	Default = Enum.KeyCode.H,
	Hold = false,
    Flag = "HideKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        hideKey.Value = OrionLib.Flags["HideKeybind"].Value
        print("Hide Keybind is now: " .. tostring(hideKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Complete Library",
	Default = Enum.KeyCode.B,
	Hold = false,
    Flag = "LibraryKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        completeLibraryKey.Value = OrionLib.Flags["LibraryKeybind"].Value
        print("Complete Library Keybind is now: " .. tostring(completeLibraryKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Check Health",
	Default = Enum.KeyCode.V,
	Hold = false,
    Flag = "HealthKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        healthKey.Value = OrionLib.Flags["HealthKeybind"].Value
        print("Check Health Keybind is now: " .. tostring(healthKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "FullBright",
	Default = Enum.KeyCode.F,
	Hold = false,
    Flag = "FullbrightKeybind",
    Save = true,
	Callback = function()
        fbKey.Value = OrionLib.Flags["FullbrightKeybind"].Value
        print("FullBright Keybind is now: " .. tostring(fbKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Pause Music",
	Default = Enum.KeyCode.K,
	Hold = false,
    Flag = "PauseKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        print("Pause Music Keybind is now: " .. tostring(completeLibraryKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Stop Music",
	Default = Enum.KeyCode.P,
	Hold = false,
    Flag = "StopKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        print("Stop Music Keybind is now: " .. tostring(completeLibraryKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Play Selected Song",
	Default = Enum.KeyCode.O,
	Hold = false,
    Flag = "PlayKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        print("Play Selected Song Keybind is now: " .. tostring(completeLibraryKey.Value))
	end,    
})

messagesTab:AddParagraph("Messages", "Use variables {action}, {entity}, {roomsUntilEntity}, {nextEntityRoom}, and {prediction} for easier reference.")

messagesTab:AddTextbox({
	Name = "Entity Soon Message",
	Default = incomingEntityMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		incomingEntityMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "Entity In Next Room Message",
	Default = entityIncomingInNextRoomMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		entityIncomingInNextRoomMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "Entity Spawned Message",
	Default = entitySpawnedMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		entitySpawnedMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "/next Message",
	Default = nextCommandMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		nextCommandMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "/predict Message",
	Default = predictCommandMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		predictCommandMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "Library Message",
	Default = libraryMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		libraryMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "Facility Message",
	Default = facilityMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		facilityMsg = Value
	end	  
})

local function playSong(songToPlayID)
    if songToPlayID == "STOP" then
        song:Stop()
        song.Playing = false
        song.SoundId = ""
    end

    song.SoundId = songToPlayID

    song:Play()
end

local function playMusic(songValue)
    if songValue == "None" then
        playSong("STOP")
    end

    if songValue == "Elevator Jam" then
        playSong("rbxassetid://7249833877")
    end

    if songValue == "Dawn of The Doors" then
        playSong("rbxassetid://7767530145")
    end

    if songValue == "Here I Come" then
        playSong("rbxassetid://9932603531")
    end

    if songValue == "Unhinged" then
        playSong("rbxassetid://10470707502")
    end

    if songValue == "Guiding Light" then
        playSong("rbxassetid://10460221938")
    end

    if songValue == "Rock Bottom" then
        playSong("rbxassetid://8474472363")
    end
end

local musicSongDropdown = miscTab:AddDropdown({
	Name = "Song",
	Default = "None",
	Options = {"None", "Elevator Jam", "Dawn of The Doors", "Guiding Light", "Here I Come", "Unhinged", "Rock Bottom"},
    Flag = "CurrentSongLunar",
	Callback = function(songValue)
		SongName.Text = songValue

        playMusic(songValue)
        
        notifyUser("Now Playing", songValue)
	end,    
})

miscTab:AddSlider({
	Name = "Music Volume",
	Min = 0,
	Max = 10,
	Default = 1,
	Color = Color3.fromRGB(170,221,255),
	Increment = 0.1,
	ValueName = "",
    Flag = "MusicVolumeLunar",
    Save = true,
	Callback = function(Value)
		song.Volume = Value
	end
})

miscTab:AddSlider({
	Name = "Music Playback Speed",
	Min = 0.1,
	Max = 2,
	Default = 1,
	Color = Color3.fromRGB(170,221,255),
	Increment = 0.01,
	ValueName = "playback speed",
    Flag = "PlaybackSpeedLunar",
    Save = true,
	Callback = function(Value)
		song.PlaybackSpeed = Value
	end
})

miscTab:AddToggle({
	Name = "Music Looped",
	Default = false,
	Flag = "LunarMusicLooped",
    Save = true,
    Callback = function(value)
        song.Looped = value

        notifyUser("Music", "Toggled looping!")
    end
})

miscTab:AddButton({
	Name = "Reset/Spectate",
	Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
  	end    
})

--[[ SUMMON ENTITIES ]]--

local initiator = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game

local summonSection = summonTab:AddSection({
	Name = "Summon"
})

local function findDrawer()
	for i, obj in pairs(game:GetDescendants()) do
		if obj.Name == "DrawerContainer" then
			return obj
		end
	end
end

local function summon(entity)
	if entity == "Screech" then
		require(game.StarterGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
	elseif entity == "Halt" then
		require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
	elseif entity == "Glitch" then
		require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
	elseif entity == "Timothy" then
		local drawer = findDrawer()
			
		if drawer then
			require(initiator.RemoteListener.Modules.SpiderJumpscare)(require(initiator), drawer, 0.2)
		else
			notifyUser("Summon", "Failed to summon Timothy! Could not find a drawer to summon Timothy in.")
		end
	elseif entity == "SeekEye" then
		require(game.ReplicatedStorage.ClientModules.EntityModules.Seek).tease(nil, workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")], 100)
	elseif entity == "Jack" then
		local currentLoadedRoom
		local function setRooms()
			local tb = {}
			table.foreach(workspace.CurrentRooms:GetChildren(), function(_, r)
				if r:FindFirstChild("RoomStart") then
					table.insert(tb, tonumber(r.Name))
				end
			end)
			currentLoadedRoom = workspace.CurrentRooms[tostring(math.max(unpack(tb)) - 1)]
		end
		setRooms()
		require(game.ReplicatedStorage.ClientModules.Module_Events).tryp(currentLoadedRoom, 9e307)
	elseif entity == "Rush" then
		loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Rush")

		local tb=entityTable["Ambush"]
		tb.Speed=120
		tb.Sounds={"PlaySound", "Footsteps"}
		tb.Model="https://github.com/sponguss/storage/raw/main/newambush.rbxm"
		tb.Ambush.Enabled=true
		tb.WaitTime=2.5

		loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Rush")
	elseif entity == "Ambush" then
		loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().createEntity("Ambush")

		local tb=entityTable["Ambush"]
		tb.Speed=120
		tb.Sounds={"PlaySound", "Footsteps"}
		tb.Model="https://github.com/sponguss/storage/raw/main/newambush.rbxm"
		tb.Ambush.Enabled=true
		tb.WaitTime=2.5

		loadstring(game:HttpGet"https://raw.githubusercontent.com/sponguss/storage/main/entitySpawner.lua")().runEntity("Ambush")
	end
end

summonSection:AddParagraph("Notice!", "These entities are spawned only on the client, meaning other players will not have the ability to see or hear these entities. These entities will also not damage you or other players.")

summonSection:AddButton({
	Name = "Summon Screech",
	Callback = function()
		summon("Screech")
	end,
})

summonSection:AddButton({
	Name = "Summon Halt",
	Callback = function()
		summon("Halt")
	end,
})

summonSection:AddButton({
	Name = "Summon Glitch",
	Callback = function()
		summon("Glitch")
	end,
})

summonSection:AddButton({
	Name = "Summon Timothy",
	Callback = function()
		summon("Timothy")
	end,
})

summonSection:AddButton({
	Name = "Summon Seek Eye",
	Callback = function()
		summon("SeekEye")
	end,
})

summonSection:AddButton({
	Name = "Summon Jack",
	Callback = function()
		summon("Jack")
	end,
})

summonSection:AddButton({
	Name = "Summon Rush",
	Callback = function()
		summon("Rush")
	end,
})

summonSection:AddButton({
	Name = "Summon Ambush",
	Callback = function()
		summon("Ambush")
	end,
})

local keybindsSection = summonTab:AddSection({
	Name = "Summon Keybinds"
})

keybindsSection:AddBind({
	Name = "Summon Screech",
	Default = Enum.KeyCode.KeypadOne,
	Hold = false,
    	Flag = "SummonScreech",
   	Save = true,
	Callback = function()
        	summon("Screech")
	end,    
})

keybindsSection:AddBind({
	Name = "Summon Halt",
	Default = Enum.KeyCode.KeypadTwo,
	Hold = false,
    	Flag = "SummonHalt",
    	Save = true,
	Callback = function()
        	summon("Halt")
	end,    
})

keybindsSection:AddBind({
	Name = "Summon Glitch",
	Default = Enum.KeyCode.KeypadThree,
	Hold = false,
    	Flag = "SummonGlitch",
    	Save = true,
	Callback = function()
        	summon("Glitch")
	end,    
})

keybindsSection:AddBind({
	Name = "Summon Timothy",
	Default = Enum.KeyCode.KeypadFour,
	Hold = false,
    	Flag = "SummonTimothy",
    	Save = true,
	Callback = function()
        	summon("Timothy")
	end,    
})

keybindsSection:AddBind({
	Name = "Summon Seek Eye",
	Default = Enum.KeyCode.KeypadFive,
	Hold = false,
    	Flag = "SummonSeekEye",
    	Save = true,
	Callback = function()
        	summon("SeekEye")
	end,    
})

keybindsSection:AddBind({
	Name = "Summon Jack",
	Default = Enum.KeyCode.KeypadSix,
	Hold = false,
    	Flag = "SummonJack",
    	Save = true,
	Callback = function()
        	summon("Jack")
	end,    
})

keybindsSection:AddBind({
	Name = "Summon Rush",
	Default = Enum.KeyCode.KeypadSeven,
	Hold = false,
    	Flag = "SummonRush",
    	Save = true,
	Callback = function()
        	summon("Rush")
	end,    
})

keybindsSection:AddBind({
	Name = "Summon Ambush",
	Default = Enum.KeyCode.KeypadEight,
	Hold = false,
    	Flag = "SummonAmbush",
    	Save = true,
	Callback = function()
        	summon("Ambush")
	end,    
})

--[[

local function autoScreech(v)
	while wait() do
		if v == true then
			require(initiator.RemoteListener.Modules.Screech)(require(initiator))
			wait(OrionLib.Flags["AutoScreechRate"].Value)
		else
			break
		end
	end
end

local autoSection = summonTab:AddSection({
	Name = "Auto-Summon"
})

autoSection:AddSlider({
	Name = "Auto-Summon Screech Rate",
	Min = 0.01,
	Max = 60,
	Default = 0.5,
	Color = Color3.fromRGB(170,221,255),
	Increment = 0.01,
	ValueName = "second delay",
    Flag = "AutoScreechRate",
    Save = true,
	Callback = function(Value)
		
	end
})

autoSection:AddToggle({
	Name = "Auto-Summon Screech",
	Default = false,
	Flag = "AutoScreech",
    Save = true,
    Callback = function(value)
        autoScreech(Value)
    end
})

]]--

OrionLib:MakeNotification({
	Name = "Loaded GUI!",
	Content = "Loaded Lunar GUI!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

setclipboard("https://discord.gg/shcdVcSsQx")
notifyUser("LunarCrocs", "Join the discord! Copied invite to your clipboard.", 10)

local tipRooms = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100}

local player = game.Players.LocalPlayer

local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom

local function ApplyKeyChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(100,0,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(255,0,0)
    Cham.Parent = inst
    Cham.Adornee = inst
    Cham.Enabled = true
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyDoorChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(0,0,100)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,0,255)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyLeverChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(100,0,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(255,0,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyFigureChams(inst)
	wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(100,0,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(255,0,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyCharChams(char)
    wait()
    
    if char:FindFirstChild("Highlight") then
        char:WaitForChild("Highlight"):Destroy()
    end

    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(0,100,100)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,255,255)
    Cham.Parent = char
    Cham.Enabled = true
    Cham.Adornee = char
    Cham.RobloxLocked = true
    return Cham
end

local function ApplySeekChams(inst)
	wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(100,100,100)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,0,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyRushChams(inst)
    local RushCham = Instance.new("BillboardGui")
    local Rush = Instance.new("ImageLabel")

    RushCham.Name = "RushCham"
    RushCham.Parent = inst
    RushCham.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    RushCham.Active = true
    RushCham.AlwaysOnTop = true
    RushCham.LightInfluence = 1.000
    RushCham.Size = UDim2.new(6.5079999, 0, 6.5079999, 0)
    RushCham.StudsOffset = Vector3.new(0, 1.25, 0)

    Rush.Name = "Rush"
    Rush.Parent = RushCham
    Rush.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Rush.BackgroundTransparency = 1.000
    Rush.BorderSizePixel = 0
    Rush.Size = UDim2.new(1, 0, 1, 0)
    Rush.Image = "http://www.roblox.com/asset/?id=10642754311"
    Rush.ImageColor3 = Color3.fromRGB(2524, 255, 255)
end

local function ApplyAmbushChams(inst)
    local AmbushCham = Instance.new("BillboardGui")
    local Ambush = Instance.new("ImageLabel")

    AmbushCham.Name = "AmbushCham"
    AmbushCham.Parent = inst
    AmbushCham.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    AmbushCham.Active = true
    AmbushCham.AlwaysOnTop = true
    AmbushCham.LightInfluence = 1.000
    AmbushCham.Size = UDim2.new(6.5079999, 0, 6.5079999, 0)
    AmbushCham.StudsOffset = Vector3.new(0, 1.25, 0)

    Ambush.Name = "Ambush"
    Ambush.Parent = AmbushCham
    Ambush.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Ambush.BackgroundTransparency = 1.000
    Ambush.BorderSizePixel = 0
    Ambush.Size = UDim2.new(1, 0, 1, 0)
    Ambush.Image = "http://www.roblox.com/asset/?id=10722835155"
    Ambush.ImageColor3 = Color3.fromRGB(2524, 255, 255)
end

game.Workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
    if inst.Name == "KeyObtain" then
        ApplyKeyChams(inst)
	elseif inst.Name == "LeverForGate" then
		ApplyLeverChams(inst)
    end
end)

local function ApplyBookChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(0,100,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,255,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyItemChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(0,100,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,255,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyHidingChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(0,100,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,255,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function searchForBooks()
    for i,v in pairs(game:GetService("Workspace").CurrentRooms["50"].Assets:GetDescendants()) do
        if v.Name == "LiveHintBook" then
            ApplyBookChams(v)
        end
    end
end



local function chat(msg, alert)
    if SECRETEDITION == false then
        game.TextChatService.TextChannels.RBXGeneral:SendAsync(msg, "All")
    end
    
    if alert then
        notifyUser("Chat", msg, nil, true)
    else
        notifyUser("Chat", msg)
    end
end

local function notice(msg)
    chat(msg)
end

local function alert(msg)
    chat(msg)
end

local function warn2(msg)
    chat(msg)
end

local function randomTip()
	local randomNum = math.random(1,3)

	local tips = {"Want to know when the next entity spawns? Use '/next' and it will give you the room the entity will spawn in!", "Wondering what entity could spawn next? Use '/predict' and it will predict what entity will spawn!", "'Lunar AI - professionally programmed by nicK'"}

	if tipsEnabled == false then return "Tips Disabled" end

	return tips[randomNum]
end

LatestRoom.Changed:Connect(function()
    ApplyDoorChams(game.Workspace.CurrentRooms:FindFirstChild(tostring(LatestRoom.Value)).Door.Door)
    
    if LatestRoom.Value == 50 then
        searchForBooks()
		chat(returnDefinedMessage(libraryMsg))
        currentEntity = "Figure"
		warn("Entered library!")
    elseif LatestRoom.Value == 100 then
		chat(returnDefinedMessage(facilityMsg))
        currentEntity = "Figure"
		warn("Entered the facility!")
	end
end)

chat("Welcome to DOORS! Loading Lunar AI...")
wait(0.5)
chat("Loaded Lunar AI!")
chat("Lunar AI // Version " .. aiVersion .. " // Made by probablYnicK")
print("Loaded Lunar AI // DOORS // Version " .. aiVersion .. " // Made by probablYnicK")

LatestRoom.Changed:Connect(function()
    local n = ChaseStart.Value - LatestRoom.Value
	
	if table.find(tipRooms, LatestRoom.Value) then
		local generatedTip = randomTip()

		if generatedTip ~= "Tips Disabled" then
			chat(generatedTip)
		end
	end
	
    warn("The next entity will spawn in " .. n .. " room(s). (Room " .. ChaseStart.Value .. ")")
    if n < 4 and n > 0 then
        if n == 1 then
            chat(returnDefinedMessage(entityIncomingInNextRoomMsg))
        else
            chat(returnDefinedMessage(incomingEntityMsg))
        end
    end
end)

local sprintingFunction

game.Workspace.DescendantAdded:Connect(function(inst)
    if inst.Name == "RushMoving" then
        chat(returnDefinedMessage(entitySpawnedMsg, "Rush"), true)
		ApplyRushChams(inst)
        currentEntity = "Rush"
        warn("Rush spawned!")
    elseif inst.Name == "AmbushMoving" then
        chat(returnDefinedMessage(entitySpawnedMsg, "Ambush"), true)
		ApplyAmbushChams(inst)
        currentEntity = "Ambush"
        warn("Ambush spawned!")
    elseif inst.Name == "SeekMoving" then
        chat(returnDefinedMessage(entitySpawnedMsg, "Seek"), true)
        ApplySeekChams(inst)
        currentEntity = "Seek"
        warn("Seek chase has started! (Room " .. LatestRoom.Value .. ")")
    elseif inst.Name == "FigureRagdoll" then
		ApplyFigureChams(inst)
	elseif (inst.Name == "Shade" or inst.Name == "Halt" or inst.Name == "HaltMoving") and LatestRoom.Value ~= 99 then
		chat(returnDefinedMessage(entitySpawnedMsg, "Halt"), true)
        currentEntity = "Halt"
		warn("Halt spawned! (Room " .. LatestRoom.Value .. ")")
    elseif inst.Name == "Screech" then
        notifyUser("Psst!", "Screech spawned! Quickly look for him!", nil, true)
        warn("Psst! (Screech spawned!)")
    elseif inst.Name == "Lookman" then
        chat(returnDefinedMessage(entitySpawnedMsg, "Eyes"), true)
        currentEntity = "Eyes"
        warn("Eyes spawned!")
    end

    if inst.Name == "Lighter" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end

    if inst.Name == "Lockpick" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end

    if inst.Name == "Vitamins" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end

    if inst.Name == "Flashlight" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end
    
    if inst.Name == "GoldPile" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end

    if inst.Name == "Battery" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end
end)

game.Workspace.ChildAdded:Connect(function(inst)
    if (inst.Name == "RushMoving" or inst.Name == "AmbushMoving") and OrionLib.Flags["AutoHideLunar"].Value == true then
        if inst.Name == "RushMoving" then
            notifyUser("Avoiding!", "Avoiding Rush!", nil, true)
        elseif inst.Name == "AmbushMoving" then
            notifyUser("Avoiding!", "Avoiding Ambush!", nil, true)
        end

        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local hideFunction = game:GetService("RunService").Heartbeat:Connect(function()
            game.Players.LocalPlayer.Character:MoveTo(oldPos + Vector3.new(0, OrionLib.Flags["AvoidHeightLunar"].Value, 0))
        end)
        
        inst.Destroying:Wait()
        hideFunction:Disconnect()

        game.Players.LocalPlayer.Character:MoveTo(oldPos)
    end
end)

local importantAssets = {
	"Wardrobe",
	"Bed",
	"Paintings",
	"LightStand",
	"Window",
	"KeyObtain",
	"LeverForGate",
	"Light_Fixtures",
}

LatestRoom.Changed:Connect(function()
	local room = game.Workspace.CurrentRooms:FindFirstChild(tostring(LatestRoom.Value))

	for i, obj in pairs(room:WaitForChild("Assets"):GetChildren()) do
		if obj.Name == "Bed" or obj.Name == "Wardrobe" then
			ApplyHidingChams(obj)
		end
	end
end)

LatestRoom.Changed:Connect(function()
	if OrionLib.Flags["RemoveAssets"].Value == false then return end

	local room = game.Workspace.CurrentRooms:FindFirstChild(tostring(LatestRoom.Value))

	if LatestRoom.Value == 50 or LatestRoom.Value == 100 then return end

	if room then
		local assets = room:FindFirstChild("Assets")
		
		if assets then
			for i, obj in pairs(assets:GetChildren()) do
				if table.find(importantAssets, obj.Name) then
					warn("Lunar AI // Asset " .. obj.Name .. " is important!")
				else
					for i, important in pairs(importantAssets) do
						local removable = true
					
						for i, desc in pairs(obj:GetDescendants()) do
							if table.find(importantAssets, desc.Name) then
								warn("Lunar AI // Asset " .. obj.Name .. " is important! [CONTAINS IMPORTANT ITEM]")
								removable = false
							else
								
							end
						end
						
						if removable == true then obj:Destroy() end
					end
				end
			end
		end
		
		
	end
end)

local function predict()
	local room = ChaseStart.Value

	if room >= 30 and room <= 40 then
		return "Seek - Chase 1"
	end

	if room >= 51 and room <= 79 then
		return "Ambush"
	end

	if room >= 80 and room <= 90 then
		return "Seek - Chase 2"
	end

	if room >= 91 and room <= 99 then
		return "Ambush"
	end

	if room < 10 then
		return "Halt"
	end

	return "Rush"
end

lunarAPI.onplayerchatted:Connect(function(data)
	local msg = data.Text
		
	if string.lower(msg) == "/next" then
		wait(0.1)
		chat(returnDefinedMessage(nextCommandMsg), true)
	end
	if string.lower(msg) == "/predict" then
		local prediction = predict()
		wait(0.1)
		chat(returnDefinedMessage(predictCommandMsg, nil, prediction), true)
	end
       	if string.lower(msg) == "/aiversion" then
		wait(0.1)
           chat("Current Version: Lunar AI // Version " .. aiVersion, true)
	end
end)

for i, plr in pairs(game.Players:GetPlayers()) do
    if plr.Character then
        ApplyCharChams(plr.Character)
    end
    
    plr.CharacterAdded:Connect(function(char)
		ApplyCharChams(char)
    end)
end

--Other Functions--

local function getEmptyCloset(roomAssets)
	for i, obj in pairs(roomAssets:GetDescendants()) do
		if obj.Name == "Wardrobe" or obj.Name == "Bed" then
			if obj:WaitForChild("HiddenPlayer").Value == nil then
				return obj:WaitForChild("Main")
			end
		end
	end

	return nil
end

local function toClosetInRoom()
	local room = game:GetService("Workspace"):WaitForChild("CurrentRooms"):FindFirstChild(LatestRoom.Value)

	if room then
		local assets = room:FindFirstChild("Assets")

		if assets then
			local closet = getEmptyCloset(assets)

			if closet then
				local char = game.Players.LocalPlayer.Character

				if char then
                    closet.CanCollide = false

					local destination = CFrame.new(closet.CFrame.X, closet.CFrame.Y, closet.CFrame.Z)

					char:SetPrimaryPartCFrame(destination)

                    char:WaitForChild("Head").CFrame = CFrame.lookAt(char.Head.Position, closet.Position)

					wait()

					fireproximityprompt(closet.Parent:WaitForChild("HidePrompt"))

					notifyUser("Success!", "Successfully hid!")
				else
					notifyUser("No Character", "Your character was not found!")
				end
			else
				notifyUser("No Closets", "There are no empty closets in your current room!")
			end
		else
			warn("Error! Could not find Assets!")
		end
	else
		warn("Error! Could not find room!")
	end
end

local function getBooks()
	local books = {}

	for i, book in pairs(game:GetService("Workspace"):GetDescendants()) do
		if book.Name == "LiveHintBook" then
			table.insert(books, book)
		end
	end

	return books
end

local function getPaper()
    local paper = game.Workspace.CurrentRooms[LatestRoom.Value]:FindFirstChild("PickupItem")
    
    if paper then
        return paper:WaitForChild("Handle")
    else
        return nil
    end
end

local function completeLibrary()
    local bookFunction
	local char = game.Players.LocalPlayer.Character

	if char then
		print("Got character for autocompletion!")
        char.HumanoidRootPart.Anchored = true
	else
		notifyUser("Failed", "No character was found!")
		return
	end

	if LatestRoom.Value == 50 then
		for i, book in pairs(getBooks()) do
			
            local destination = CFrame.new(book.Base.Position)
         
            char:PivotTo(destination)
            
            wait(0.3)

            fireproximityprompt(book:WaitForChild("ActivateEventPrompt"))

            wait()
		end

        local paper = getPaper()
        local destination = CFrame.new(paper.Position)

        if paper and char:FindFirstChild("LibraryHintPaper") == nil then
            char:PivotTo(destination)
            
            wait(0.3)

            fireproximityprompt(paper.Parent:WaitForChild("ModulePrompt"))
            

            local room = game.Workspace.CurrentRooms["50"]
            local doorDestination = CFrame.new(room.Door.Door.Position)

            wait(0.3)

            char:PivotTo(doorDestination)
        else
            notifyUser("Failed", "Could not find Paper!")
            char.HumanoidRootPart.Anchored = false
            return
        end

        char.HumanoidRootPart.Anchored = false
	else
        char.HumanoidRootPart.Anchored = false
		notifyUser("Unavailable", "You must be in the Library (Room 50) to autocomplete!")
		return
	end
end

--Keybinds + Actions --

local UIS = game:GetService("UserInputService")

local sprinting = false

UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed == true then return end

    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["SprintKeybind"].Value] then
        sprintingFunction = game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                    game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * OrionLib.Flags["SprintSpeedLunar"].Value/50)
                end
            end)
        end)
    end

    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["HealthKeybind"].Value] then
        for i, player in pairs(game.Players:GetPlayers()) do
            local char = player.Character
            local humanoid = nil

            if char then
                humanoid = char.Humanoid
            end
            

            if humanoid then
                if humanoid.Health == 0 then
                    notifyUser(player.DisplayName, "[ DEAD ]")
                else
                    notifyUser(player.DisplayName, humanoid.Health .. " HP")
                end
            end
            wait()
        end
    end

    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["PlayKeybind"].Value] then
        playMusic(OrionLib.Flags["CurrentSongLunar"].Value)
    end
    
    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["FullbrightKeybind"].Value] then
        fbEnabled = not fbEnabled
        
        wait()
        
        if fbEnabled == true then
        	lighting.Brightness = OrionLib.Flags["FullbrightIntensity"].Value
			lighting.GlobalShadows = false
			lighting.ClockTime = 12
			lighting.FogEnd = 786543
			lighting.Ambient = Color3.fromRGB(178, 178, 178)
        else
        	lighting.Brightness = normalLightingSettings.Brightness
			lighting.GlobalShadows = normalLightingSettings.GlobalShadows
			lighting.ClockTime = normalLightingSettings.ClockTime
			lighting.FogEnd = normalLightingSettings.FogEnd
			lighting.Ambient = normalLightingSettings.Ambient
        end
    end
    
    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["PauseKeybind"].Value] then
        song.Playing = not song.Playing

        if song.Playing == true then
            notifyUser("Music", "Unpaused music!")
        elseif song.Playing == false then
            notifyUser("Music", "Paused music!")
        end
    end

    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["StopKeybind"].Value] then
        musicSongDropdown:Set("None", true)

        notifyUser("Music", "Stopped Music!")
    end

	if input.KeyCode == Enum.KeyCode[OrionLib.Flags["HideKeybind"].Value] then
		toClosetInRoom()
	end

    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["LibraryKeybind"].Value] then
        completeLibrary()
    end

	if input.KeyCode == Enum.KeyCode[OrionLib.Flags["FullAIKeybind"].Value] then
        fullAI.Value = not fullAI.Value
        
        if fullAI.Value == true then
            OrionLib:MakeNotification({
                Name = "Full AI",
                Content = "Turned Full AI on!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        elseif fullAI.Value == false then
            OrionLib:MakeNotification({
                Name = "Full AI",
                Content = "Turned Full AI off!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
        
    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["SkipRoomKeybind"].Value] then
        local room = game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]

		local destination = CFrame.new(room.Door.Door.CFrame.X, room.Door.Door.CFrame.Y, room.Door.Door.CFrame.Z)

		local char = game.Players.LocalPlayer.Character
		
		local roomKey = nil

		if game.Players.LocalPlayer.Character:FindFirstChild("Key") then
			char:SetPrimaryPartCFrame(destination)

       		OrionLib:MakeNotification({
            	Name = "Skipped Room",
				Content = "Successfully skipped Room " .. LatestRoom.Value,
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		
			return
		end
		
		for i, obj in pairs(room:GetDescendants()) do
			if obj.Name == "KeyObtain" then
				roomKey = obj
			end
			
			if obj.Name == "LeverForGate" then
				roomKey = obj
			end
		end

		if roomKey then
			if roomKey.Name == "KeyObtain" then
				notifyUser("Skipping Room", "Getting key...")
				char:PivotTo(CFrame.new(roomKey.Hitbox.Position))
				wait(0.3)
				fireproximityprompt(roomKey.ModulePrompt, 0)
				char:PivotTo(CFrame.new(room.Door.Door.Position))
				wait(0.3)
				fireproximityprompt(room.Door.Lock.UnlockPrompt, 0)
				notifyUser("Skipped Room!", "Successfully skipped Room " .. tostring(LatestRoom.Value - 1) .. "!")
			elseif roomKey.Name == "LeverForGate" then
				notifyUser("Skipping Room", "Opening gate...")
				char:PivotTo(CFrame.new(roomKey.Main.Position))
				wait(0.3)
				fireproximityprompt(roomKey.ActivateEventPrompt, 0)
				char:PivotTo(CFrame.new(room.Door.Door.Position))
				notifyUser("Skipped Room!", "Successfully skipped Room " .. tostring(LatestRoom.Value - 1) .. "!")
			end
		else
			char:SetPrimaryPartCFrame(destination)
		end
    end

	if input.KeyCode == Enum.KeyCode[OrionLib.Flags["TpKeyKeybind"].Value] then
        local room = game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
		
		local roomKey = nil

		local char = game.Players.LocalPlayer.Character

		for i, obj in pairs(room:GetDescendants()) do
			if obj.Name == "KeyObtain" then
				roomKey = obj
			end
			
			if obj.Name == "LeverForGate" then
				roomKey = obj
			end
		end

		if roomKey then
			if roomKey.Name == "KeyObtain" then
				char:PivotTo(CFrame.new(roomKey.Hitbox.Position))
			
				wait(0.3)
				
				fireproximityprompt(roomKey.ModulePrompt, 0)
				
				OrionLib:MakeNotification({
		            Name = "Collected Key",
					Content = "Press 'R' to teleport to the door.",
					Image = "rbxassetid://4483345998",
					Time = 5
				})
			elseif roomKey.Name == "LeverForGate" then
				char:PivotTo(CFrame.new(roomKey.Main.Position))
				
				wait(0.3)
				
				fireproximityprompt(roomKey.ActivateEventPrompt, 0)
				
				OrionLib:MakeNotification({
		            Name = "Opened Gate",
					Content = "Press 'R' to teleport to the door.",
					Image = "rbxassetid://4483345998",
					Time = 5
				})
			end
		else
			OrionLib:MakeNotification({
            	Name = "No Key",
				Content = "A key was not found!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			return
		end
    end
end)

UIS.InputEnded:Connect(function(input, gameProcessed)
	if gameProcessed == true then return end

	if input.KeyCode == Enum.KeyCode[OrionLib.Flags["SprintKeybind"].Value] then
		sprintingFunction:Disconnect()
	end
end)

lighting.Changed:Connect(function()
	if fbEnabled == true then
		lighting.Brightness = OrionLib.Flags["FullbrightIntensity"].Value
		lighting.GlobalShadows = false
		lighting.ClockTime = 12
		lighting.FogEnd = 786543
		lighting.Ambient = Color3.fromRGB(178, 178, 178)
	end
end)

--Headlight--

local headlight = Instance.new("SpotLight")
headlight.Brightness = HeadlightBrightnessLunar.Value
headlight.Face = Enum.NormalId.Front
headlight.Range = 90
headlight.Parent = game.Players.LocalPlayer.Character.Head
headlight.Enabled = HeadlightEnabledLunar.Value

HeadlightEnabledLunar:GetPropertyChangedSignal("Value"):Connect(function()
    headlight.Enabled = HeadlightEnabledLunar.Value
end)

HeadlightBrightnessLunar:GetPropertyChangedSignal("Value"):Connect(function()
    headlight.Brightness = HeadlightBrightnessLunar.Value
end)

--Instant ProximityPrompt--

game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
    fireproximityprompt(prompt)
end)

--Full AI--

local pathfindingService = game:GetService("PathfindingService")

LatestRoom.Changed:Connect(function()
    if fullAI.Value == true then
        local room = game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
        
        if game.ReplicatedStorage.GameData.LatestRoom.Value == 50 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 then
            fullAI.Value = false

            OrionLib:MakeNotification({
            	Name = "Full AI",
				Content = "Full AI was disabled due the room being 50 or 100.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
            return
        end

        OrionLib:MakeNotification({
            Name = "Full AI",
			Content = "Pathfinding to the door of Room " .. LatestRoom.Value,
			Image = "rbxassetid://4483345998",
			Time = 5
		})

        wait(1)

        print("Full AI // Lunar AI // Pathfinding to door...")

		local char = game.Players.LocalPlayer.Character
		
		--[[
		if char then
			local path = pathfindingService:CreatePath()
		
			path:ComputeAsync(char.HumanoidRootPart.Position, room.Door.Door.Position)
			
			local waypoints = path:GetWaypoints()
			
			for i, waypoint in pairs(waypoints) do
				char.Humanoid:MoveTo(waypoint.Position)
				char.Humanoid.MoveToFinished:Wait()
				
				print("Moving to waypoint...")
			end
		else
			return		
		end
		
		]]--
        
        local nodes = room:WaitForChild("Nodes")
        
        if game.ReplicatedStorage.GameData.LatestRoom.Value == 50 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 then
            fullAI.Value = false

            OrionLib:MakeNotification({
            	Name = "Full AI",
				Content = "Full AI was disabled due the room being 50 or 100.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
            return
        end

        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

        for i, node in pairs(nodes:GetDescendants()) do
			if node.Name == tostring(i) then
                humanoid:MoveTo(node.Position)
                humanoid.MoveToFinished:Wait()
            end
		end
    end
end)

--[[ Lunar AI // Code Parser ]]--

local hintTable = {}

game.Players.LocalPlayer.Character.ChildAdded:Connect(function(tool)
	if tool.Name == "LibraryHintPaper" then
		local parsed = {}
		local paperUI = tool:WaitForChild("UI")
		
		for i = 1,5,1 do
			local hint = paperUI:FindFirstChild(tostring(i))
			
			if hint then
				local hintNum = hintTable[hint.ImageRectOffset.X/50]
				
				print(hint.ImageRectOffset.X/50)
				
				if hintNum ~= nil then
					parsed[i] = hintNum
				end
			end
		end
		
		local fullParsed = ""
		
		for i = 1,5 do
			local inTable = parsed[i]
			
			fullParsed = fullParsed .. (inTable or "_")
		end
		
		notifyUser("Lunar AI // Code Parser", "Parsed Code: " .. fullParsed, 10, true)
	end
end)

game.ReplicatedStorage.Bricks.PadlockHint.OnClientEvent:Connect(function(tableNum, num, _)
	if tableNum and num then
		hintTable[tableNum] = tostring(num)
	else
		hintTable = {}
	end
end)

--Freecam--

------------------------------------------------------------------------
-- Freecam
-- Cinematic free camera for spectating and video production.
------------------------------------------------------------------------

local pi    = math.pi
local abs   = math.abs
local clamp = math.clamp
local exp   = math.exp
local rad   = math.rad
local sign  = math.sign
local sqrt  = math.sqrt
local tan   = math.tan

local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end

local Camera = Workspace.CurrentCamera
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	local newCamera = Workspace.CurrentCamera
	if newCamera then
		Camera = newCamera
	end
end)

------------------------------------------------------------------------

local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
local FREECAM_MACRO_KB = {Enum.KeyCode.LeftShift, Enum.KeyCode.P}

local NAV_GAIN = Vector3.new(1, 1, 1)*64
local PAN_GAIN = Vector2.new(0.75, 1)*8
local FOV_GAIN = 300

local PITCH_LIMIT = rad(90)

local VEL_STIFFNESS = 1.5
local PAN_STIFFNESS = 1.0
local FOV_STIFFNESS = 4.0

------------------------------------------------------------------------

local Spring = {} do
	Spring.__index = Spring

	function Spring.new(freq, pos)
		local self = setmetatable({}, Spring)
		self.f = freq
		self.p = pos
		self.v = pos*0
		return self
	end

	function Spring:Update(dt, goal)
		local f = self.f*2*pi
		local p0 = self.p
		local v0 = self.v

		local offset = goal - p0
		local decay = exp(-f*dt)

		local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
		local v1 = (f*dt*(offset*f - v0) + v0)*decay

		self.p = p1
		self.v = v1

		return p1
	end

	function Spring:Reset(pos)
		self.p = pos
		self.v = pos*0
	end
end

------------------------------------------------------------------------

local cameraPos = Vector3.new()
local cameraRot = Vector2.new()
local cameraFov = 0

local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
local fovSpring = Spring.new(FOV_STIFFNESS, 0)

------------------------------------------------------------------------

local Input = {} do
	local thumbstickCurve do
		local K_CURVATURE = 2.0
		local K_DEADZONE = 0.15

		local function fCurve(x)
			return (exp(K_CURVATURE*x) - 1)/(exp(K_CURVATURE) - 1)
		end

		local function fDeadzone(x)
			return fCurve((x - K_DEADZONE)/(1 - K_DEADZONE))
		end

		function thumbstickCurve(x)
			return sign(x)*clamp(fDeadzone(abs(x)), 0, 1)
		end
	end

	local gamepad = {
		ButtonX = 0,
		ButtonY = 0,
		DPadDown = 0,
		DPadUp = 0,
		ButtonL2 = 0,
		ButtonR2 = 0,
		Thumbstick1 = Vector2.new(),
		Thumbstick2 = Vector2.new(),
	}

	local keyboard = {
		W = 0,
		A = 0,
		S = 0,
		D = 0,
		E = 0,
		Q = 0,
		U = 0,
		H = 0,
		J = 0,
		K = 0,
		I = 0,
		Y = 0,
		Up = 0,
		Down = 0,
		LeftShift = 0,
		RightShift = 0,
	}

	local mouse = {
		Delta = Vector2.new(),
		MouseWheel = 0,
	}

	local NAV_GAMEPAD_SPEED  = Vector3.new(1, 1, 1)
	local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
	local PAN_MOUSE_SPEED    = Vector2.new(1, 1)*(pi/64)
	local PAN_GAMEPAD_SPEED  = Vector2.new(1, 1)*(pi/8)
	local FOV_WHEEL_SPEED    = 1.0
	local FOV_GAMEPAD_SPEED  = 0.25
	local NAV_ADJ_SPEED      = 0.75
	local NAV_SHIFT_MUL      = 0.25

	local navSpeed = 1

	function Input.Vel(dt)
		navSpeed = clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)

		local kGamepad = Vector3.new(
			thumbstickCurve(gamepad.Thumbstick1.x),
			thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
			thumbstickCurve(-gamepad.Thumbstick1.y)
		)*NAV_GAMEPAD_SPEED

		local kKeyboard = Vector3.new(
			keyboard.D - keyboard.A + keyboard.K - keyboard.H,
			keyboard.E - keyboard.Q + keyboard.I - keyboard.Y,
			keyboard.S - keyboard.W + keyboard.J - keyboard.U
		)*NAV_KEYBOARD_SPEED

		local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)

		return (kGamepad + kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
	end

	function Input.Pan(dt)
		local kGamepad = Vector2.new(
			thumbstickCurve(gamepad.Thumbstick2.y),
			thumbstickCurve(-gamepad.Thumbstick2.x)
		)*PAN_GAMEPAD_SPEED
		local kMouse = mouse.Delta*PAN_MOUSE_SPEED
		mouse.Delta = Vector2.new()
		return kGamepad + kMouse
	end

	function Input.Fov(dt)
		local kGamepad = (gamepad.ButtonX - gamepad.ButtonY)*FOV_GAMEPAD_SPEED
		local kMouse = mouse.MouseWheel*FOV_WHEEL_SPEED
		mouse.MouseWheel = 0
		return kGamepad + kMouse
	end

	do
		local function Keypress(action, state, input)
			keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
		end

		local function GpButton(action, state, input)
			gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
		end

		local function MousePan(action, state, input)
			local delta = input.Delta
			mouse.Delta = Vector2.new(-delta.y, -delta.x)
			return Enum.ContextActionResult.Sink
		end

		local function Thumb(action, state, input)
			gamepad[input.KeyCode.Name] = input.Position
			return Enum.ContextActionResult.Sink
		end

		local function Trigger(action, state, input)
			gamepad[input.KeyCode.Name] = input.Position.z
			return Enum.ContextActionResult.Sink
		end

		local function MouseWheel(action, state, input)
			mouse[input.UserInputType.Name] = -input.Position.z
			return Enum.ContextActionResult.Sink
		end

		local function Zero(t)
			for k, v in pairs(t) do
				t[k] = v*0
			end
		end

		function Input.StartCapture()
			ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
				Enum.KeyCode.W, Enum.KeyCode.U,
				Enum.KeyCode.A, Enum.KeyCode.H,
				Enum.KeyCode.S, Enum.KeyCode.J,
				Enum.KeyCode.D, Enum.KeyCode.K,
				Enum.KeyCode.E, Enum.KeyCode.I,
				Enum.KeyCode.Q, Enum.KeyCode.Y,
				Enum.KeyCode.Up, Enum.KeyCode.Down
			)
			ContextActionService:BindActionAtPriority("FreecamMousePan",          MousePan,   false, INPUT_PRIORITY, Enum.UserInputType.MouseMovement)
			ContextActionService:BindActionAtPriority("FreecamMouseWheel",        MouseWheel, false, INPUT_PRIORITY, Enum.UserInputType.MouseWheel)
			ContextActionService:BindActionAtPriority("FreecamGamepadButton",     GpButton,   false, INPUT_PRIORITY, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
			ContextActionService:BindActionAtPriority("FreecamGamepadTrigger",    Trigger,    false, INPUT_PRIORITY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
			ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb,      false, INPUT_PRIORITY, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
		end

		function Input.StopCapture()
			navSpeed = 1
			Zero(gamepad)
			Zero(keyboard)
			Zero(mouse)
			ContextActionService:UnbindAction("FreecamKeyboard")
			ContextActionService:UnbindAction("FreecamMousePan")
			ContextActionService:UnbindAction("FreecamMouseWheel")
			ContextActionService:UnbindAction("FreecamGamepadButton")
			ContextActionService:UnbindAction("FreecamGamepadTrigger")
			ContextActionService:UnbindAction("FreecamGamepadThumbstick")
		end
	end
end

local function GetFocusDistance(cameraFrame)
	local znear = 0.1
	local viewport = Camera.ViewportSize
	local projy = 2*tan(cameraFov/2)
	local projx = viewport.x/viewport.y*projy
	local fx = cameraFrame.rightVector
	local fy = cameraFrame.upVector
	local fz = cameraFrame.lookVector

	local minVect = Vector3.new()
	local minDist = 512

	for x = 0, 1, 0.5 do
		for y = 0, 1, 0.5 do
			local cx = (x - 0.5)*projx
			local cy = (y - 0.5)*projy
			local offset = fx*cx - fy*cy + fz
			local origin = cameraFrame.p + offset*znear
			local _, hit = Workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
			local dist = (hit - origin).magnitude
			if minDist > dist then
				minDist = dist
				minVect = offset.unit
			end
		end
	end

	return fz:Dot(minVect)*minDist
end

------------------------------------------------------------------------

local function StepFreecam(dt)
	local vel = velSpring:Update(dt, Input.Vel(dt))
	local pan = panSpring:Update(dt, Input.Pan(dt))
	local fov = fovSpring:Update(dt, Input.Fov(dt))

	local zoomFactor = sqrt(tan(rad(70/2))/tan(rad(cameraFov/2)))

	cameraFov = clamp(cameraFov + fov*FOV_GAIN*(dt/zoomFactor), 1, 120)
	cameraRot = cameraRot + pan*PAN_GAIN*(dt/zoomFactor)
	cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y%(2*pi))

	local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*NAV_GAIN*dt)
	cameraPos = cameraCFrame.p

	Camera.CFrame = cameraCFrame
	Camera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
	Camera.FieldOfView = cameraFov
end

------------------------------------------------------------------------

local PlayerState = {} do
	local mouseBehavior
	local mouseIconEnabled
	local cameraType
	local cameraFocus
	local cameraCFrame
	local cameraFieldOfView
	local screenGuis = {}
	local coreGuis = {
		Backpack = true,
		Chat = true,
		Health = true,
		PlayerList = true,
	}
	local setCores = {
		BadgesNotificationsActive = true,
		PointsNotificationsActive = true,
	}

	-- Save state and set up for freecam
	function PlayerState.Push()
		for name in pairs(coreGuis) do
			coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
		end
		for name in pairs(setCores) do
			setCores[name] = StarterGui:GetCore(name)
			StarterGui:SetCore(name, false)
		end
		local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		if playergui then
			for _, gui in pairs(playergui:GetChildren()) do
				if gui:IsA("ScreenGui") and gui.Enabled then
					screenGuis[#screenGuis + 1] = gui
					gui.Enabled = false
				end
			end
		end

		cameraFieldOfView = Camera.FieldOfView
		Camera.FieldOfView = 70

		cameraType = Camera.CameraType
		Camera.CameraType = Enum.CameraType.Custom

		cameraCFrame = Camera.CFrame
		cameraFocus = Camera.Focus

		mouseIconEnabled = UserInputService.MouseIconEnabled
		UserInputService.MouseIconEnabled = false

		mouseBehavior = UserInputService.MouseBehavior
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	end

	-- Restore state
	function PlayerState.Pop()
		for name, isEnabled in pairs(coreGuis) do
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
		end
		for name, isEnabled in pairs(setCores) do
			StarterGui:SetCore(name, isEnabled)
		end
		for _, gui in pairs(screenGuis) do
			if gui.Parent then
				gui.Enabled = true
			end
		end

		Camera.FieldOfView = cameraFieldOfView
		cameraFieldOfView = nil

		Camera.CameraType = cameraType
		cameraType = nil

		Camera.CFrame = cameraCFrame
		cameraCFrame = nil

		Camera.Focus = cameraFocus
		cameraFocus = nil

		UserInputService.MouseIconEnabled = mouseIconEnabled
		mouseIconEnabled = nil

		UserInputService.MouseBehavior = mouseBehavior
		mouseBehavior = nil
	end
end

local function StartFreecam()
	local cameraCFrame = Camera.CFrame
	cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
	cameraPos = cameraCFrame.p
	cameraFov = Camera.FieldOfView

	velSpring:Reset(Vector3.new())
	panSpring:Reset(Vector2.new())
	fovSpring:Reset(0)

	PlayerState.Push()
	RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	Input.StartCapture()
end

local function StopFreecam()
	Input.StopCapture()
	RunService:UnbindFromRenderStep("Freecam")
	PlayerState.Pop()
end

------------------------------------------------------------------------

do
	local enabled = false

	local function ToggleFreecam()
		if enabled then
			StopFreecam()
		else
			StartFreecam()
		end
		enabled = not enabled
	end

	local function CheckMacro(macro)
		for i = 1, #macro - 1 do
			if not UserInputService:IsKeyDown(macro[i]) then
				return
			end
		end
		ToggleFreecam()
	end

	local function HandleActivationInput(action, state, input)
		if state == Enum.UserInputState.Begin then
			if input.KeyCode == FREECAM_MACRO_KB[#FREECAM_MACRO_KB] then
				CheckMacro(FREECAM_MACRO_KB)
			end
		end
		return Enum.ContextActionResult.Pass
	end

	ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY, FREECAM_MACRO_KB[#FREECAM_MACRO_KB])
end

--ENTITY INFO--

local images = {
	Rush = "rbxassetid://10642754311",
	Ambush = "rbxassetid://10722835155",
	Seek = "rbxassetid://10715669534",
	Figure = "rbxassetid://10745200497",
	Halt = "rbxassetid://10824865061",
    Eyes = "rbxassetid://10865377911",
	None = "rbxassetid://403653614",
}

game.Workspace.DescendantAdded:Connect(function(t)
	wait(0.05)

	if currentEntity == "Rush" then
		EntityImage.Image = images.Rush
	end
	if currentEntity == "Ambush" then
		EntityImage.Image = images.Ambush
	end
	if currentEntity == "Seek" then
		EntityImage.Image = images.Seek
	end
	if currentEntity == "Figure" and t.Name == "Figure" then
		EntityImage.Image = images.Figure
		ApplyFigureChams(t)
	end
	if currentEntity == "Halt" then
		EntityImage.Image = images.Halt
	end
    if currentEntity == "Eyes" then
		EntityImage.Image = images.Eyes
	end
	if currentEntity == "None" then
		EntityImage.Image = images.None
	end

    if t.Name == "TriggerEventCollision" and OrionLib.Flags["SkipSeekLunar"].Value == true then
        t:Destroy()

		wait(0.5)
	
		if game.Workspace:FindFirstChild("SeekMoving") then
		    game.Workspace:WaitForChild("SeekMoving"):Destroy()
		end
    end

    if (t.Name == "Seek_Arm" or t.Name == "ChandelierObstruction") and OrionLib.Flags["RemoveObstructionsLunar"].Value == true then
        t:Destroy()
    end

    if (t.Name == "RushMoving" or t.Name == "AmbushMoving" or t.Name == "ShadeMoving" or t.Name == "Shade" or t.Name == "FigureRagdoll" or t.Name == "HaltMoving" or t.Name == "SeekMoving") and currentEntity ~= "None" then
        local entity = getEntity(currentEntity)

        if entity then
            game.CoreGui.LunarUI.MainFrame.EntityInfo.EntityName.Text = currentEntity
            game.CoreGui.LunarUI.MainFrame.EntityInfo.EntityImage.Image = images[currentEntity]
        else
            warn("Could not find entity for name: " .. currentEntity .. "!")
        end
    end
end)

game.Workspace.CurrentRooms.ChildAdded:Connect(function(c)
    if c:FindFirstChild("WeirdCeilngThing") and OrionLib.Flags["RemoveObstructionsLunar"].Value == true then
        for i, asset in pairs(c:WaitForChild("Assets"):GetChildren()) do
            if asset:IsA("Model") then
                asset:Destroy()
            end
        end
    end
end)

game.Workspace.DescendantRemoving:Connect(function(t)
	if t.Name == "RushMoving" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
	if t.Name == "AmbushMoving" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
	if  t.Name == "SeekMoving" or t.Name == "Seek" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
	if t.Name == "Figure" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
	if t.Name == "Shade" or t.Name == "Halt" or t.Name == "HaltMoving" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
    if t.Name == "Lookman" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
end)

ChaseStart.Changed:Connect(function()
	RoomNumber.Text = "Room " .. ChaseStart.Value
end)

OrionLib:Init()
