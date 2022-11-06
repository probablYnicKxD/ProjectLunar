local gameID = game.PlaceId

if gameID == 6516141723 then
  local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
  OrionLib:MakeNotification({
      Name = "WARNING!",
      Content = "Do NOT execute Lunar AI in the lobby as it could get you permanently banned!",
      Time = 30
  })
  OrionLib:Destroy()
  return
elseif gameID == 000 then
  print("Lunar Loader | Game detected! Loading Lunar AI // DOORS...")
  loadstring(game:HttpGet("https://raw.githubusercontent.com/probablYnicKxD/lunarAI/main/mainNoUIraw.lua"))()
  print("Lunar Loader | Loaded Lunar AI // DOORS!")
end
