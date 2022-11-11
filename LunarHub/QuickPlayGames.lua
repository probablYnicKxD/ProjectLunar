local quickPlayGames = {}

quickPlayGames.Games = {}

function quickPlayGames:JoinGame(gameID, jobID)
    if jobID then
        print("LunarHub // Joining server with server ID: " .. jobID .. "...")
        game:GetService('TeleportService'):TeleportToPlaceInstance(gameID, jobID, game.Players.LocalPlayer)
    else
        print("LunarHub // Joining game with ID: " .. gameID .. "...")
        game:GetService('TeleportService'):Teleport(gameID, game.Players.LocalPlayer)
    end
end

function quickPlayGames:AddGame(name, gameID)
    if gameID == 0 then return end

    local success,errMsg = pcall(function()
        quickPlayGames.Games[name] = {
            Name = name,
            GameID = gameID
        }
        
        local gm = quickPlayGames[name]
        
        if gm then
            function gm:JoinGame()
                quickPlayGames:JoinGame(gameID)
            end
        end
    end)
    
    if success then
        return quickPlayGames[name]
    elseif not success and errMsg then
        warn("Failed to add game // Error Message:\n" .. errMsg)
        return nil
    end
end

function quickPlayGames:GetGamePlayers(gameID)
    local httpService = game:GetService("HttpService")
    
    local plrs = httpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games?universeIds=" .. gameID))
    
    return plrs[0].playing
end

local function addGame(name, gameID)
    return quickPlayGames:AddGame(name, gameID)
end

addGame("DOORS 👁", 6516141723)
addGame("Evade", 9872472334)
addGame("Adopt Me!", 0) --getting next script upd because am lazy 💀
addGame("Blox Fruits", 2753915549)
addGame("Da Hood", 2788229376)
addGame("Prison Life", 155615604)
addGame("Ninja Legends", 3956818381)
addGame("Ninja Legends 2", 5977280685)
addGame("BedWars", 6872265039)
addGame("Ro-Ghoul", 914010731)
addGame("Funky Friday", 6447798030)
addGame("Mad City", 1224212277)
addGame("Bee Swarm Simulator", 1537690962)
addGame("Auto Rap Battles", 579955134)
addGame("Doomspire", 1215581239)
addGame("Jailbreak", 606849621)
addGame("Lumber Tycoon", 13822889)

return quickPlayGames
