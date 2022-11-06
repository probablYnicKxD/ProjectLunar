# Lunar Library - Version 0.1.0 Beta - Documentation
This documentation is for the Beta release of Lunar Library. Expect many bugs in Lunar Library, as it does not even have a notification system yet.

## Booting Lunar Library
```lua
local lunarLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/probablYnicKxD/ProjectLunar/main/LunarLibrary.lua"))()
```

## Making a new Window
```lua
lunar:NewWindow({
	Name - <string> The name of the window.
	Icon - <number> The ID of the icon.
  OpenKey - <Enum.KeyCode> The key for opening/closing the window.
})
```

## Making a new Tab
```lua
Window:NewTab({
	Name - <string> The name of the tab.
})
```

## Adding a Button to a Tab
```lua
Tab:AddButton({
	Name - <string> The name of the button.
	Icon - <number> The ID of the icon.
	PressFunction - <function> the function that fires when the button is pressed.
})
```

## Adding a Toggle Button to a Tab
```lua
Tab:AddToggleButton({
	Name - <string> The name of the toggle button.
	Flag - <stringValue> The name of the flag that the toggle will report to (optional)
	OnColor - <Color3_RGB> The color that shows when the toggle is on.
	Default - <boolValue> The default value of the toggle button.
})
```

## Adding a Slider to a Tab
```lua
Tab:AddSlider({
	Name - <string> The name of the slider.
	Flag - <stringValue> The name of the flag that the slider will report to (optional)
	MaxValue - <int/numberValue> The maxmimum slider amount.
	Default - <int/numberValue> The default slider amount.
})
```

## Adding a TextBox to a Tab
```lua
Tab:AddTextbox({
	Name - <string> The name of the slider.
	Flag - <stringValue> The name of the flag that the textbox will report to (optional)
	PlaceholderText - <string> The text that appears when there is no text inputted.
})
```

## Adding a KeyBind to a Tab
```lua
Tab:AddKeybind({
	Name - <string> The name of the slider.
	Flag - <stringValue> The name of the flag that the bind will report to (optional)
	Default - <Enum.KeyCode> The default value of the keybind.
})
```

## Accessing Flags
```lua
Tab:AddToggleButton({
	Name = "My Test Toggle Button",
  Flag = "MyTestFlag",
  OnColor = Color3.fromRGB(170, 221, 255),
  Default = false
})

print(tostring(lunarLib.Flags["MyTestFlag"].Value)) --For boolean flags, you may have to use the integrated-into-lua tostring() function to convert the boolean into a string.  
```
`OUTPUT:`
```
false
```
Flags only work with Toggles, Sliders, TextBoxes, and KeyBinds.

##### Please remember that this version of Lunar Library is not stable and updates are guaranteed to be broken or buggy. Please be patient as Lunar Library gets better and better. Updates soon!
