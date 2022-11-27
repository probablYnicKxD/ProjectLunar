local module = {}

local lexer 	= require(script.Parent.Lexer)
local theme 	= require(script.Parent.Theme)
local textFixer = require(script.Parent.TextFixer)

local function ColorToFont(text, color)
	return string.format(
		'<font color="rgb(%s,%s,%s)">%s</font>',
		tostring(math.floor(color.R * 255)),
		tostring(math.floor(color.G * 255)),
		tostring(math.floor(color.B * 255)),
		text
	)
end

function module.Highlight(textbox, source)
	textbox.Text = ""

	for tokenType, text in lexer.scan(source) do
		local currentTheme = theme.current
		local tokenCol = currentTheme[tokenType]

		if tokenCol then
			textbox.Text = textbox.Text .. ColorToFont(text, tokenCol)
		else
			textbox.Text = textbox.Text .. text
		end
	end

	textFixer.Fix(textbox)
end

return module
