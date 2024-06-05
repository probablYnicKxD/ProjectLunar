--[[

    game libary handwritten by probablYnicK and soon to be used for LunarHub

    dm me if you want me to add a game to the library

    also dm me if you find an error in game info, like creator name typo, game name typo, etc.

    discord: lunaR_nicK#6800

]]--

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

function quickPlayGames:AddGame(name, gameID, gameCreator)
    if gameID == 0 then return end

    local success,errMsg = pcall(function()
        quickPlayGames.Games[name] = {
            Name = name,
            GameID = gameID,
            GameCreator = gameCreator,
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

local function addGame(name, gameID, gameCreator)
    return quickPlayGames:AddGame(name, gameID, gameCreator)
end

addGame("DOORS 👁", 6516141723, "LSPLASH")
addGame("ER:LC", 2534724415, "Police Roleplay Community")
addGame("SolarPin Bowling", 14883941981, "probablYnicK")
addGame("Evade", 9872472334, "Hexagon Development Community")
addGame("Adopt Me!", 920587237, "DreamCraft")
addGame("Blox Fruits", 2753915549, "Gamer Robot Inc")
addGame("Da Hood", 2788229376, "Da Hood Entertainment")
addGame("Prison Life", 155615604, "Aesthetical")
addGame("Ninja Legends", 3956818381, "Scriptbloxian Studios")
addGame("Ninja Legends 2", 5977280685, "Scriptbloxian Studios")
addGame("BedWars", 6872265039, "Easy.gg")
addGame("Ro-Ghoul", 914010731, "SushiWalrus")
addGame("Funky Friday", 6447798030, "Lyte Interactive")
addGame("Mad City", 1224212277, "Schwifty Studios")
addGame("Bee Swarm Simulator", 1537690962, "Onett")
addGame("Auto Rap Battles", 579955134, "Auto Rap Battles Community")
addGame("Doomspire Brickbattle", 1215581239, "Temple of Brickbattle")
addGame("Jailbreak", 606849621, "Badimo")
addGame("Lumber Tycoon 2", 13822889, "Defaultio")
addGame("Pet Simulator X", 6284583030, "BIG Games Pets")
addGame("Brookhaven", 4924922222, "Wolfpaq")
addGame("Rainbow Friends", 7991339063, "Fragment Games")
addGame("Livetopia", 6737970321, "Century Makers")
addGame("Murder Mystery 2", 142823291, "Nikilis")
addGame("MeepCity", 370731277, "alexnewtron")
addGame("Build A Boat For Treasure", 537413528, "Chillz Studios")
addGame("Flee the Facility", 893973440, "A.W. Apps")
addGame("Arsenal", 286090429, "ROLVe")
addGame("Tower of Hell", 1962086868, "YXCeptional Studios")
addGame("PLS DONATE", 8737602449, "haz3mn")
addGame("3008", 2768379856, "uglyburger0")
addGame("Plane Crazy", 166986752, "madattak")
addGame("a literal baseplate.", 4483381587, "evilitself")
addGame("RUNNING FROM THE INTERNET", 11195100561, "SYSTEM_32")
addGame("Strucid", 2377868063, "Frosted Studio")
addGame("Tropical Royale", 10351562025, "SirSkittles")

return quickPlayGames
