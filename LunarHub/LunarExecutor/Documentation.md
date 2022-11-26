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

## More coming soon!
