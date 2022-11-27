local theme = {
	themes = {
		["default"] = {
			["keyword"] = Color3.fromRGB(248, 109, 124),
			["builtin"] = Color3.fromRGB(84, 184, 247),
			["string"] = Color3.fromRGB(130, 241, 149),
			["number"] = Color3.fromRGB(255, 198, 0),
			["comment"] = Color3.fromRGB(106, 106, 100),
			["thingy"] = Color3.fromRGB(253, 251, 154)
		},
		["extra 2"] = {
			["keyword"] = Color3.fromRGB(249, 36, 114),
			["builtin"] = Color3.fromRGB(95, 209, 250),
			["string"] = Color3.fromRGB(217, 219, 88),
			["number"] = Color3.fromRGB(161, 118, 209),
			["comment"] = Color3.fromRGB(116, 122, 101),
			["thingy"] = Color3.fromRGB(248, 245, 139)
		}
	}
}

theme.current = theme.themes["extra 2"]

return theme
