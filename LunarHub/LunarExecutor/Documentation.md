# LunarExecutor - API Documentation
### This is the official LunarExecutor API documentation.
##### The executor uses `lunar` as its API base, similar to Synapse X. Example: `lunar.function()`

## Utility
### Chatting
You can send a message in the Roblox chat with the `lunar.chat` function.
```lua
lunar.chat("This message was sent from LunarExecutor's API!")
```
### Kicking the User
You can kick the current user with the `lunar.kick` function.
```lua
lunar.kick("You have been kicked from the lunar.kick() function in LunarExecutor's API!")
```
### Protecting a GUI
You protect a GUI with the `lunar.protectui` function. The function will only work if the external executor supports `syn.protect_gui` or `protect_gui`.
```lua
lunar.protectui(myUIThatShouldBeProtectedByLunarExecutor)
```
### Getting the External Executor
You can get the user's executor with the `lunar.getexecutor` function. The function takes in the argument of `includelunar`, a boolean. (`true` or `false`)
```lua
print(lunar.getexecutor(true)) --prints "Lunar Executor // YourExecutor" with "YourExecutor" being the executor that LunarExecutor/LunarHub was run on. (Comet, Synapse X, Krnl, Script-Ware, etc.)
```
### Loading a File
You can load a script file using the `lunar.load` function. It takes in the argument of `path`, being the path of the file it should load.
```lua
print(lunar.load("test.txt")) --prints the test.txt's contents, in this case "This is a test file!"
```
### Detecting when a player chats
You can detect when a player chats using the `lunar.onplayerchatted` function.
```lua
lunar.onplayerchatted:Connect(function(data)
  local msg = data.Message
  local speaker = data.FromSpeaker
  print(speaker .. ": " .. msg)
end)
```

## Signals
### Creating a Signal
You can load a script file using the `lunar.createsignal` function.
```lua
local mySignal = lunar.createsignal()
```
### Firing a created Signal
You can fire a signal using the `lunarsignal:Fire` function.
```lua
mySignal:Fire(args)
```
### Connecting a function to a created Signal
You can connect a function to your signal by using the `lunarsignal:Connect` function.
```lua
local myConnection = mySignal:Connect(function(args)
  --stuff
end)
```
### Disconnecting a connection from a created Signal
You can disconnected a created function using the `lunarconnection:Disconnect` function.
```lua
myConnection:Disconnect()
```

## More coming soon!
