--[[
  
  NOTICE! this was NOT made by probablYnicK and is just a reupload of a model on roblox onto github!
  
]]--


-- Lexer by sleitnick
-- Everything else by me, bread. lol.


local module = {}

local syntax 	   = require(script.Syntax)
local getLines 	   = require(script.GetLines)
local fakeEditor   = require(script.FakeEditor)
local textFixer    = require(script.TextFixer)
local getLine 	   = require(script.GetLine)
local tween 	   = require(script.TweenLibrary)
local suggestions  = require(script.Suggestions)

function module.new(frame)
	local newEditor = script.Editor:Clone()
	newEditor.Parent = frame

	local editorObj  	= fakeEditor.new(newEditor)
	local textbox 	 	= newEditor.Scroll.Source
	local linesLabel 	= newEditor.Scroll.Left.Lines
	local lineHighlight = textbox.LineHighlight

	local highlightBox = Instance.new("TextLabel")
	highlightBox.Size = UDim2.new(1, 0,1, 0)
	highlightBox.Position = UDim2.new(0, 0,0, 0)
	highlightBox.TextColor3 = textbox.TextColor3
	highlightBox.BackgroundTransparency = 1
	highlightBox.Name = "Syntax"
	highlightBox.RichText = true
	highlightBox.TextSize = textbox.TextSize
	highlightBox.Font = textbox.Font
	highlightBox.TextXAlignment = Enum.TextXAlignment.Left
	highlightBox.TextYAlignment = Enum.TextYAlignment.Top
	highlightBox.TextStrokeColor3 = Color3.fromRGB(40, 40, 40)
	highlightBox.TextStrokeTransparency = 0.1
	highlightBox.Text = ""
	highlightBox.Parent = textbox
	
	editorObj:SetTheme("default")
	textFixer.Fix(highlightBox)
	suggestions:Start(newEditor)

	textbox:GetPropertyChangedSignal("Text"):Connect(function()
		syntax.Highlight(highlightBox, textbox.Text)

		-- Fix tabs
		textbox.Text = textbox.Text:gsub("\t", "    ")
		--textbox.CursorPosition += 4
		
		-- Update line count
		linesLabel.Text = getLines.GetLinesString(textbox.Text)
	end)
	
	textbox:GetPropertyChangedSignal("CursorPosition"):Connect(function()
		-- Position line highlight
		local lineYPos = ((getLine:GetCurrentLine(textbox) * textbox.TextSize) - math.ceil(lineHighlight.AbsoluteSize.Y / 2)) + 4

		if lineYPos ~= lineHighlight.Position.Y.Offset then
			tween.TweenPosition(lineHighlight, UDim2.new(0, -10,0, lineYPos), 0.1, Enum.EasingStyle.Quad)
		end
	end)

	return editorObj
end

return module
