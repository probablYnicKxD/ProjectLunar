--[[

  LunarHub is releasing soon!

]]--

--[[ Configurations ]]--

local LunarHubSavingFolderName = "LunarHub Configurations"

--[[ Loading LunarHub + Protection + Configuration Saving ]]--

local LunarHub = game:GetObjects("rbxassetid://0")[1]

--Protection--

if gethui then
	LunarHub.Parent = gethui()
elseif syn.protect_gui then
	syn.protect_gui(LunarHub)
	LunarHub.Parent = game.CoreGui
else
	LunarHub.Parent = game.CoreGui
end

--Configuration Saving--

if makefolder and isfolder then
  
else
    warn("LunarHub // Could not make configurations folder for LunarHub!")
end

--[[ Playerlist System ]]--

local playerList = game.Players:GetPlayers()
local usingLunarList = {}

for i, player in pairs(playerList) do
    player.Chatted:Connect(function(msg)
        msg = string.lower(msg)
      
        if msg == "___" then
            table.insert(usingLunarList, player)
            print("Detected " .. player.DisplayName .. " (@" .. player.Name .. ") is using Lunar!"
        end
    end)
end
  


--[[ Using Lunar Detection System ]]--

local function chat(msg)
  game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(msg, "All")
end

chat("___")
