--[[

  LunarHub is releasing soon!

]]--

local function chat(msg)
  game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(msg, "All")
end

chat("___")
