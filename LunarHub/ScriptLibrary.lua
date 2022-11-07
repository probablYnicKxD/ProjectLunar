--[[

    Script Library for LunarHub, an upcoming script hub to Project Lunar.

    Releasing soon.

    SCRIPTS FROM https://scriptblox.com

    CONTACT lunaR_nicK#6800 ON DISCORD FOR SCRIPT REMOVAL!

]]--

local scripts = {}

local tags = {
	"Patched",
	"PositiveReviews",
	"ProjectLunar",
	"ScriptHub",
	"ScriptLoader",
	"VerifiedCreator",
	"VerifiedScript",
	"New!",
	"CMD",
}

scripts.UnfairHub = {
	Name = "unfair Hub",
	Description = "Get an unfair advantage in 47+ games with this amazing hub by unfair!",
	LoadstringScript = "loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))()",
	SupportedGames = {
		6516141723,
		9872472334,
		2377868063,
		6284583030,
		286090429,
		6407649031,
		292439477,
		2609668898,
		2986677229,
		2788229376,
		4042427666,
		621129760,
		6403373529,
		3527629287,
		3233893879,
		1240123653,
		920587237,
		9281034297,
		4282985734,
		8916037983,
		6897226634,
		914010731,
		9551640993,
		5712833750,
		8737602449,
		4924922222,
		6755746130,
		6872265039,
		7026949294,
		1730877806,
		2317712696,
		1537690962,
		2809202155,
		734159876,
		5326405001,
		5956785391,
		6678877691,
		9285238704,
		445664957,
		7991339063,
		6808416928,
		10675066724,
		5985232436,
		10347946161,
		6172932937,
		9264596435,
		2413927524,
	},
	KeySys = false,
	MultipleGames = true,
	Creator = "unfair",
	Universal = false,
	Tags = {
		"PositiveReviews",
		"VerifiedScript",
		"ScriptHub"
	}
}

scripts.LunarAIDOORS = {
	Name = "Lunar AI // DOORS",
	Description = "Powered by Lunar itself, use Lunar AI in DOORS, the popular horror game created by the development team at LSPLASH, to get an easy win while helping others in the process.",
	LoadstringScript = "loadstring(game:HttpGet('https://raw.githubusercontent.com/probablYnicKxD/lunarAI/main/mainNoUIraw.lua'))()",
	SupportedGames = {
		6516141723,
	},
	KeySys = true,
	MultipleGames = false,
	Universal = false,
	Creator = "probablYnicK",
	Tags = {
		"VerifiedCreator",
		"VerifiedScript",
		"ProjectLunar",
		"PositiveReviews",
	}
}

scripts.EvadeReal_King = {
	Name = "King - Evade",
	Description = "Get an amazing advantage in the popular nextbot game Evade with this amazing script by Real_King. Verified and tested by nicK.",
	LoadstringScript = "loadstring(game:HttpGet('https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua'))()",
	SupportedGames = {
		9872472334,
	},
	KeySys = true,
	MultipleGames = false,
	Universal = false,
	Creator = "Real_King",
	Tags = {
		"VerifiedScript",
		"PositiveReviews",
		"VerifiedCreator",
	}
}

scripts.Vynixius_DOORS = {
	Name = "Vynixius",
	Description = "Destroy the entities and conquer door 100 in DOORS by LSPLASH with this amazing script by RegularVynixu!",
	LoadstringScript = "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua",
	SupportedGames = {
		6516141723,
	},
	KeySys = false,
	MultipleGames = false,
	Universal = false,
	Creator = "RegularVynixu",
	Tags = {
		"VerifiedScript",
		"VerifiedCreator",
		"PositiveReviews",
	}
}

scripts.InfiniteYield = {
	Name = "Infinite Yield",
	Description = "With over 350+ commands, Infinite Yield is one of the best FE command line scripts for Roblox, and you can execute it right here, right now on LunarHub.",
	LoadstringScript = "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()",
	SupportedGames = {},
	KeySys = false,
	MultipleGames = true,
	Universal = true,
	Creator = "EdgeIY",
	Tags = {
		"VerifiedScript",
		"VerifiedCreator",
		"PositiveReviews",
		"CMD",
	}
}

scripts.TestScript = {
	Name = "LunarHub Test Script",
	Description = "This is a test script for LunarHub. If you are in a public release of this script and you can see this script, please contact lunaR_nicK#6800 on Discord, or report it in the Project Lunar Discord server.",
	LoadstringScript = "loadstring(game:HttpGet('https://pastebin.com/raw/nRzYiwuL'))()",
	SupportedGames = {},
	MultipleGames = true,
	Universal = true,
	KeySys = false,
	Creator = "probablYnicK",
	Tags = {
		"VerifiedScript",
		"VerifiedCreator",
		"PositiveReviews",
		"New"
	}
}

scripts.CMDX = {
	Name = "CMDX",
	Description = "With over 600+ commands, CMDX is one of the BEST command line scripts on Roblox. Some say it's better than Infinite Yield! Made by a development team, it's guaranteed to get you an advantage in every game.",
	LoadstringScript = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()',
	SupportedGames = {},
	MultipleGames = true,
	Universal = true,
	KeySys = false,
	Creator = "CMD-X Development Team",
	Tags = {
		"VerifiedScript",
		"VerifiedCreator",
		"PositiveReviews",
		"CMD",
	}
}

return scripts
