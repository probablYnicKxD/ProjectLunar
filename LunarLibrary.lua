local lunar = {}

local lunarInterface = Instance.new("ScreenGui")

lunarInterface.Name = "LunarInterface"
lunarInterface.Parent = game.CoreGui
lunarInterface.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local lunarFlags = Instance.new("Folder", lunarInterface)
lunarFlags.Name = "LunarFlags"

lunar.Flags = lunarFlags

function lunar:NewWindow(propTable)
	local Window = Instance.new("Frame")
	local TopBar = Instance.new("Frame")
	local Minimize = Instance.new("ImageButton")
	local Close = Instance.new("ImageButton")
	local Lunar = Instance.new("ImageButton")
	local Title = Instance.new("TextLabel")
	local SidebarTabs = Instance.new("Frame")
	local Lister = Instance.new("UIListLayout")
	local Contents = Instance.new("ScrollingFrame")
	local Lister_2 = Instance.new("UIListLayout")

	Window.Name = "Window"
	Window.Parent = lunarInterface
	Window.AnchorPoint = Vector2.new(0.5, 0.5)
	Window.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Window.BorderSizePixel = 0
	Window.ClipsDescendants = true
	Window.Position = UDim2.new(0.5, 0, 0.5, 0)
	Window.Size = UDim2.new(0, 500, 0, 300)
	Window.ZIndex = 1

	TopBar.Name = "TopBar"
	TopBar.Parent = Window
	TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TopBar.BorderSizePixel = 0
	TopBar.Size = UDim2.new(1, 0, 0, 30)
	TopBar.ZIndex = 1000

	Close.Name = "Minimize"
	Close.Parent = TopBar
	Close.BackgroundTransparency = 1.000
	Close.Position = UDim2.new(0, 470, 0, 0)
	Close.Size = UDim2.new(0, 30, 0, 30)
	Close.ZIndex = 2
	Close.Image = "rbxassetid://3926305904"
	Close.ImageRectOffset = Vector2.new(284, 4)
	Close.ImageRectSize = Vector2.new(24, 24)

	local isClosed = false

	Close.MouseButton1Click:Connect(function()
		if isClosed == false then
			isClosed = true
			Window:TweenSize(UDim2.new(0,500,0,0), "Out","Quad", 0.5, true)
		else
			isClosed = false
			Window:TweenSize(UDim2.new(0,500,0,300), "Out","Quad", 0.5, true)
		end
	end)

	if propTable["OpenKey"] then
		game:GetService("UserInputService").InputBegan:Connect(function(input)
			if input.KeyCode == propTable["OpenKey"] then
				if isClosed == false then
					isClosed = true
					Window:TweenSize(UDim2.new(0,500,0,0), "Out","Quad", 0.5, true)
				else
					isClosed = false
					Window:TweenSize(UDim2.new(0,500,0,300), "Out","Quad", 0.5, true)
				end
			end
		end)
	end


	Minimize.Name = "Close"
	Minimize.Parent = TopBar
	Minimize.BackgroundTransparency = 1.000
	Minimize.LayoutOrder = 6
	Minimize.Position = UDim2.new(0, 440, 0, 0)
	Minimize.Size = UDim2.new(0, 30, 0, 30)
	Minimize.ZIndex = 2
	Minimize.Image = "rbxassetid://3926307971"
	Minimize.ImageRectOffset = Vector2.new(884, 284)
	Minimize.ImageRectSize = Vector2.new(36, 36)

	local isMinimized = false

	Minimize.MouseButton1Click:Connect(function()
		if isMinimized == false then
			isMinimized = true
			Window:TweenSize(UDim2.new(0,500,0,30), "Out","Quad", 0.5, true)
		else
			isMinimized = false
			Window:TweenSize(UDim2.new(0,500,0,300), "Out","Quad", 0.5, true)
		end
	end)

	Lunar.Name = "Lunar"
	Lunar.Parent = TopBar
	Lunar.BackgroundTransparency = 1.000
	Lunar.LayoutOrder = 11
	Lunar.Position = UDim2.new(0, 5, 0, 5)
	Lunar.Rotation = 180.000
	Lunar.Size = UDim2.new(0, 20, 0, 20)
	Lunar.ZIndex = 2
	Lunar.Image = "rbxassetid://3926307971"
	Lunar.ImageRectOffset = Vector2.new(324, 204)
	Lunar.ImageRectSize = Vector2.new(36, 36)
	Lunar.ScaleType = Enum.ScaleType.Fit

	Title.Name = "Title"
	Title.Parent = TopBar
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0, 25, 0, 0)
	Title.Size = UDim2.new(0, 300, 1, 0)
	Title.Font = Enum.Font.GothamBold
	Title.Text = "Lunar Library"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 20.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	SidebarTabs.Name = "SidebarTabs"
	SidebarTabs.Parent = Window
	SidebarTabs.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	SidebarTabs.BorderColor3 = Color3.fromRGB(35, 35, 35)
	SidebarTabs.BorderSizePixel = 0
	SidebarTabs.Position = UDim2.new(0, 0, 0, 30)
	SidebarTabs.Size = UDim2.new(0, 100, 0, 270)
	SidebarTabs.ZIndex = -1

	Lister.Name = "Lister"
	Lister.Parent = SidebarTabs
	Lister.SortOrder = Enum.SortOrder.LayoutOrder

	Contents.Name = "Contents"
	Contents.Parent = Window
	Contents.Active = true
	Contents.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Contents.BackgroundTransparency = 1.000
	Contents.BorderSizePixel = 0
	Contents.Position = UDim2.new(0, 100, 0, 40)
	Contents.Size = UDim2.new(0, 400, 0, 260)
	Contents.ScrollBarThickness = 0

	Lister_2.Name = "Lister"
	Lister_2.Parent = Contents
	Lister_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	Lister_2.SortOrder = Enum.SortOrder.LayoutOrder
	Lister_2.Padding = UDim.new(0, 5)

	if propTable["Name"] then
		Title.Text = propTable["Name"]
		Window.Name = propTable["Name"]
	end

	if propTable["Icon"] then
		Lunar.Image = tonumber(propTable["Icon"])
	end

	local windowFunctions = {}

	function windowFunctions:NewTab(tabProps)
		local Tab = Instance.new("TextButton")
		local TabContents = Instance.new("Frame")
		local Lister = Instance.new("UIListLayout")

		Lister.Name = "Lister"
		Lister.Parent = TabContents
		Lister.HorizontalAlignment = Enum.HorizontalAlignment.Center
		Lister.SortOrder = Enum.SortOrder.LayoutOrder
		Lister.Padding = UDim.new(0, 5)

		Tab.Name = "Tab"
		Tab.Parent = SidebarTabs
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(1, 0, 0, 25)
		Tab.Font = Enum.Font.GothamBold
		Tab.Text = "Tab"
		Tab.TextColor3 = Color3.fromRGB(175, 175, 175)
		Tab.TextSize = 17.000
		Tab.MouseButton1Click:Connect(function()
			for i, otherTab in pairs(Contents:GetChildren()) do
				if otherTab:IsA("Frame") then
					otherTab.Visible = false
				end
			end

			for i, otherTabButton in pairs(SidebarTabs:GetChildren()) do
				if otherTabButton:IsA("TextButton") then
					otherTabButton.TextColor3 = Color3.fromRGB(175,175,175)
				end
			end

			Tab.TextColor3 = Color3.fromRGB(255,255,255)
			TabContents.Visible = true
		end)

		if tabProps["Name"] then
			Tab.Name = tabProps["Name"]
			Tab.Text = tabProps["Name"]
		end

		TabContents.Name = Tab.Name
		TabContents.Parent = Contents
		TabContents.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabContents.BackgroundTransparency = 1
		TabContents.Size = UDim2.new(1, 0, 1, 0)

		local tabFunctions = {}

		function tabFunctions:AddButton(buttonProps)
			local Button = Instance.new("Frame")
			local ButtonRound = Instance.new("UICorner")
			local ButtonTitle = Instance.new("TextLabel")
			local Touch = Instance.new("TextButton")
			local TouchIcon = Instance.new("ImageButton")

			Button.Name = "Button"
			Button.Parent = TabContents
			Button.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
			Button.Size = UDim2.new(0.899999976, 0, 0, 40)

			ButtonRound.CornerRadius = UDim.new(0, 10)
			ButtonRound.Name = "Round"
			ButtonRound.Parent = Button

			ButtonTitle.Name = "Title"
			ButtonTitle.Parent = Button
			ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonTitle.BackgroundTransparency = 1.000
			ButtonTitle.Position = UDim2.new(0, 10, 0, 0)
			ButtonTitle.Size = UDim2.new(0.800000012, 0, 1, 0)
			ButtonTitle.Font = Enum.Font.GothamBold
			ButtonTitle.Text = "Button"
			ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonTitle.TextSize = 20.000
			ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left

			Touch.Name = "Touch"
			Touch.Parent = Button
			Touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Touch.BackgroundTransparency = 1.000
			Touch.Size = UDim2.new(1, 0, 1, 0)
			Touch.Font = Enum.Font.Gotham
			Touch.Text = ""
			Touch.TextColor3 = Color3.fromRGB(255, 255, 255)
			Touch.TextSize = 1.000

			TouchIcon.Name = "TouchIcon"
			TouchIcon.Parent = Button
			TouchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TouchIcon.BackgroundTransparency = 1.000
			TouchIcon.Position = UDim2.new(0, 325, 0, 5)
			TouchIcon.Size = UDim2.new(0, 30, 0, 30)
			TouchIcon.ZIndex = 2
			TouchIcon.Image = "rbxassetid://3926305904"
			TouchIcon.ImageColor3 = Color3.fromRGB(175, 175, 175)
			TouchIcon.ImageRectOffset = Vector2.new(164, 844)
			TouchIcon.ImageRectSize = Vector2.new(36, 36)
			TouchIcon.ScaleType = Enum.ScaleType.Fit

			if buttonProps["Name"] then
				ButtonTitle.Text = buttonProps["Name"]
				Button.Name = buttonProps["Name"]
			end

			if buttonProps["Icon"] then
				TouchIcon.Image = tostring(buttonProps["Icon"])
			end

			if buttonProps["PressFunction"] then
				Touch.MouseButton1Click:Connect(buttonProps["PressFunction"])
			end
		end

		function tabFunctions:AddToggleButton(toggleButtonProps)
			local ToggleButton = Instance.new("Frame")
			local ToggleRound = Instance.new("UICorner")
			local ToggleTitle = Instance.new("TextLabel")
			local Toggle = Instance.new("TextButton")
			local ToggleRound_2 = Instance.new("UICorner")

			ToggleButton.Name = "ToggleButton"
			ToggleButton.Parent = TabContents
			ToggleButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
			ToggleButton.Size = UDim2.new(0.899999976, 0, 0, 40)

			ToggleRound.CornerRadius = UDim.new(0, 10)
			ToggleRound.Name = "Round"
			ToggleRound.Parent = ToggleButton

			ToggleTitle.Name = "Title"
			ToggleTitle.Parent = ToggleButton
			ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleTitle.BackgroundTransparency = 1.000
			ToggleTitle.Position = UDim2.new(0, 10, 0, 0)
			ToggleTitle.Size = UDim2.new(0.800000012, 0, 1, 0)
			ToggleTitle.Font = Enum.Font.GothamBold
			ToggleTitle.Text = "Toggle Button"
			ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleTitle.TextSize = 20.000
			ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

			Toggle.Name = "Toggle"
			Toggle.Parent = ToggleButton
			Toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
			Toggle.Position = UDim2.new(0, 325, 0, 5)
			Toggle.Size = UDim2.new(0, 30, 0, 30)
			Toggle.AutoButtonColor = false
			Toggle.Font = Enum.Font.GothamMedium
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.TextSize = 1

			local toggleOnColor = Color3.fromRGB(0, 105, 235)
			local toggleOn = false

			ToggleRound_2.Name = "Round"
			ToggleRound_2.Parent = Toggle

			if toggleButtonProps["Flag"] then
				local newFlag = Instance.new("BoolValue", lunar.Flags)
				newFlag.Name = toggleButtonProps["Flag"]
				newFlag.Value = false
			end

			if toggleButtonProps["Name"] then
				ToggleTitle.Text = toggleButtonProps["Name"]
				ToggleButton.Name = toggleButtonProps["Name"]
			end

			if toggleButtonProps["OnColor"] then
				toggleOnColor = toggleButtonProps["OnColor"]
			end

			if toggleButtonProps["Default"] then
				toggleOn = toggleButtonProps["Default"]

				if toggleOn == true then
					Toggle.BackgroundColor3 = toggleOnColor

					if toggleButtonProps["Flag"] then
						lunar.Flags[toggleButtonProps["Flag"]].Value = true
					end
				elseif toggleOn == false then
					Toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

					if toggleButtonProps["Flag"] then
						lunar.Flags[toggleButtonProps["Flag"]].Value = false
					end
				end
			end

			Toggle.MouseButton1Click:Connect(function()
				if toggleOn == true then
					Toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
					toggleOn = false

					if toggleButtonProps["Flag"] then
						lunar.Flags[toggleButtonProps["Flag"]].Value = false
					end
				elseif toggleOn == false then
					Toggle.BackgroundColor3 = toggleOnColor
					toggleOn = true

					if toggleButtonProps["Flag"] then
						lunar.Flags[toggleButtonProps["Flag"]].Value = true
					end
				end
			end)
		end

		function tabFunctions:AddSlider(sliderProps)
			local UIS = game:GetService("UserInputService")


			local Slider = Instance.new("Frame")
			local SliderRound = Instance.new("UICorner")
			local SliderTitle = Instance.new("TextLabel")
			local SliderBar = Instance.new("Frame")
			local SliderRound_2 = Instance.new("UICorner")
			local Target = Instance.new("TextButton")
			local SliderRound_3 = Instance.new("UICorner")

			Slider.Name = "Slider"
			Slider.Parent = TabContents
			Slider.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
			Slider.Size = UDim2.new(0.899999976, 0, 0, 60)

			SliderRound.CornerRadius = UDim.new(0, 10)
			SliderRound.Name = "Round"
			SliderRound.Parent = Slider

			SliderTitle.Name = "Title"
			SliderTitle.Parent = Slider
			SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderTitle.BackgroundTransparency = 1.000
			SliderTitle.Position = UDim2.new(0, 10, 0, 0)
			SliderTitle.Size = UDim2.new(0.800000012, 0, 0, 40)
			SliderTitle.Font = Enum.Font.GothamBold
			SliderTitle.Text = "Slider"
			SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderTitle.TextSize = 20.000
			SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

			SliderBar.Name = "SliderBar"
			SliderBar.Parent = Slider
			SliderBar.AnchorPoint = Vector2.new(0.5, 0.5)
			SliderBar.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
			SliderBar.Position = UDim2.new(0.5, 0, 0.75, 0)
			SliderBar.Size = UDim2.new(0.899999976, 0, 0.100000001, 0)

			SliderRound_2.Name = "Round"
			SliderRound_2.Parent = SliderBar

			Target.Name = "Target"
			Target.Parent = SliderBar
			Target.AnchorPoint = Vector2.new(0, 0.5)
			Target.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
			Target.Size = UDim2.new(0, 5, 0, 20)
			Target.TextSize = 1.000
			Target.Text = ""

			SliderRound_3.CornerRadius = UDim.new(0, 30)
			SliderRound_3.Name = "Round"
			SliderRound_3.Parent = Target

			local SliderValue = Instance.new("TextLabel")

			SliderValue.Name = "SliderValue"
			SliderValue.Parent = Slider
			SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.BackgroundTransparency = 1.000
			SliderValue.Size = UDim2.new(1, 0, 0, 40)
			SliderValue.Font = Enum.Font.GothamBold
			SliderValue.Text = "0"
			SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.TextSize = 25.000

			local SliderMaximum = 50

			local dragging = false

			if sliderProps["Name"] then
				SliderTitle.Text = sliderProps["Name"]
				Slider.Name = sliderProps["Name"]
			end

			if sliderProps["MaxValue"] then
				SliderMaximum = sliderProps["MaxValue"]
			end

			Target.MouseButton1Down:Connect(function()
				dragging = true
			end)

			UIS.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)

			local sliderFlag = nil

			if sliderProps["Flag"] then
				local newFlag = Instance.new("IntValue", lunar.Flags)
				newFlag.Name = sliderProps["Flag"]
				newFlag.Value = 0
				sliderFlag = newFlag
			end

			if sliderProps["Default"] then
				SliderValue.Text = tostring(sliderProps["Default"])
				Target.Position.X = 1/SliderMaximum * sliderProps["Default"]
				if sliderFlag then
					sliderFlag.Value = sliderProps["Default"]
				end
			end

			UIS.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					if dragging == true then
						local mousePos = UIS:GetMouseLocation()
						local relativePos = mousePos - Slider.AbsolutePosition
						local percentage = math.clamp(relativePos.X/SliderBar.AbsoluteSize.X,0,1)
						Target.Position = UDim2.new(percentage,0,0,0)

						SliderValue.Text = math.round(percentage * SliderMaximum)

						if sliderFlag then
							sliderFlag.Value = math.round(percentage * SliderMaximum)
						end
					end
				end
			end)
		end

		function tabFunctions:AddTextbox(tProps)
			local Textbox = Instance.new("Frame")
			local TextboxRound = Instance.new("UICorner")
			local TextboxTitle = Instance.new("TextLabel")
			local TextBoxInput = Instance.new("TextBox")
			local TextboxRound_2 = Instance.new("UICorner")

			Textbox.Name = "Textbox"
			Textbox.Parent = TabContents
			Textbox.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
			Textbox.Size = UDim2.new(0.899999976, 0, 0, 60)

			TextboxRound.CornerRadius = UDim.new(0, 10)
			TextboxRound.Name = "Round"
			TextboxRound.Parent = Textbox

			TextboxTitle.Name = "Title"
			TextboxTitle.Parent = Textbox
			TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextboxTitle.BackgroundTransparency = 1.000
			TextboxTitle.Position = UDim2.new(0, 10, 0, 0)
			TextboxTitle.Size = UDim2.new(0.800000012, 0, 0, 40)
			TextboxTitle.Font = Enum.Font.GothamBold
			TextboxTitle.Text = "TextBox"
			TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextboxTitle.TextSize = 20.000
			TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

			TextBoxInput.Parent = Textbox
			TextBoxInput.AnchorPoint = Vector2.new(0.5, 0.5)
			TextBoxInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			TextBoxInput.Position = UDim2.new(0.5, 0, 0.699999988, 0)
			TextBoxInput.Size = UDim2.new(0.899999976, 0, 0.400000006, 0)
			TextBoxInput.ClearTextOnFocus = false
			TextBoxInput.Font = Enum.Font.GothamBold
			TextBoxInput.PlaceholderText = "Input"
			TextBoxInput.Text = ""
			TextBoxInput.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBoxInput.TextSize = 20.000

			TextboxRound_2.CornerRadius = UDim.new(0, 5)
			TextboxRound_2.Name = "Round"
			TextboxRound_2.Parent = TextBoxInput

			if tProps["Name"] then
				TextboxTitle.Text = tProps["Name"]
				TextBoxInput.Name = tProps["Name"]
			end

			if tProps["PlaceholderText"] then
				TextBoxInput.PlaceholderText = tProps["PlaceholderText"]
			end

			local textFlag = nil

			if tProps["Flag"] then
				local newFlag = Instance.new("StringValue", lunar.Flags)
				newFlag.Name = tProps["Flag"]
				newFlag.Value = ""
				textFlag = newFlag
			end

			TextBoxInput.FocusLost:Connect(function()
				if textFlag then
					textFlag.Value = TextBoxInput.Text
				end
			end)
		end

		function tabFunctions:AddKeybind(kProps)
			local Keybind = Instance.new("Frame")
			local KeybindRound = Instance.new("UICorner")
			local KeybindTitle = Instance.new("TextLabel")
			local BindButton = Instance.new("TextButton")
			local KeybindRound_2 = Instance.new("UICorner")

			Keybind.Name = "Keybind"
			Keybind.Parent = TabContents
			Keybind.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
			Keybind.Size = UDim2.new(0.899999976, 0, 0, 40)

			KeybindRound.CornerRadius = UDim.new(0, 10)
			KeybindRound.Name = "KeybindRound"
			KeybindRound.Parent = Keybind

			KeybindTitle.Name = "KeybindTItle"
			KeybindTitle.Parent = Keybind
			KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			KeybindTitle.BackgroundTransparency = 1.000
			KeybindTitle.Position = UDim2.new(0, 10, 0, 0)
			KeybindTitle.Size = UDim2.new(0.800000012, 0, 1, 0)
			KeybindTitle.Font = Enum.Font.GothamBold
			KeybindTitle.Text = "Keybind"
			KeybindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			KeybindTitle.TextSize = 20.000
			KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left

			BindButton.Name = "BindButton"
			BindButton.Parent = Keybind
			BindButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
			BindButton.Position = UDim2.new(0, 325, 0, 5)
			BindButton.Size = UDim2.new(0, 30, 0, 30)
			BindButton.AutoButtonColor = false
			BindButton.Font = Enum.Font.GothamBlack
			BindButton.Text = "E"
			BindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			BindButton.TextScaled = true
			BindButton.TextSize = 1.000
			BindButton.TextWrapped = true

			KeybindRound_2.Name = "KeybindRound"
			KeybindRound_2.Parent = BindButton

			local bindFlag = nil

			if kProps["Name"] then
				KeybindTitle.Text = kProps["Name"]
				Keybind.Name = kProps["Name"]
			end

			if kProps["Flag"] then
				local newFlag = Instance.new("StringValue", lunar.Flags)
				newFlag.Name = kProps["Flag"]
				newFlag.Value = ""
				bindFlag = newFlag
			end

			if kProps["Default"] then
				BindButton.Text = string.sub(tostring(kProps["Default"]), 14)
				if bindFlag then
					bindFlag.Value = string.sub(tostring(kProps["Default"]), 14)
				end
			end

			local UIS = game:GetService("UserInputService")

			BindButton.MouseButton1Click:Connect(function()
				BindButton.Text = "Press Key"
			end)

			UIS.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Keyboard then
					if BindButton.Text == "Press Key" then
						BindButton.Text = string.sub(tostring(input.KeyCode), 14)

						if bindFlag then
							bindFlag.Value = string.sub(tostring(input.KeyCode), 14)
						end
					end
				end
			end)
		end

		return tabFunctions
	end

	return windowFunctions
end

--[[

Properties:

--All flags are OPTIONAL!
--If you do not put anything in the tables, the object will use defaults.

			lunar:NewWindow({
				Name - <string> The name of the window.
				Icon - <numberValue> The ID of the icon.
				OpenKey - <Enum.KeyCode> The key for opening/closing the window.
			})

			Window:NewTab({
				Name - <string> The name of the tab.
			})

			Tab:AddButton({
				Name - <string> The name of the button.
				Icon - <numberValue> The ID of the icon.
				PressFunction - <function> the function that fires when the button is pressed.
			})

			Tab:AddToggleButton({
				Name - <string> The name of the toggle button.
				Flag - <stringValue> The name of the flag that the toggle will report to (optional)
				OnColor - <Color3_RGB> The color that shows when the toggle is on.
				Default - <boolValue> The default value of the toggle button.
			})

			Tab:AddSlider({
				Name - <string> The name of the slider.
				Flag - <stringValue> The name of the flag that the slider will report to (optional)
				MaxValue - <int/numberValue> The maxmimum slider amount.
				Default - <int/numberValue> The default slider amount.
			})

			Tab:AddTextbox({
				Name - <string> The name of the slider.
				Flag - <stringValue> The name of the flag that the textbox will report to (optional)
				PlaceholderText - <string> The text that appears when there is no text inputted.
			})

			Tab:AddKeybind({
				Name - <string> The name of the slider.
				Flag - <stringValue> The name of the flag that the bind will report to (optional)
				Default - <Enum.KeyCode> The default value of the keybind.
			})

]]--

--made by nick // thank you for using lunar!--

return lunar
