# Project Lunar - LunarX

### What is LunarX?
LunarX is a utility tool based off of Lua (and only works in Lua) made for easier scripting.

***LunarX will be referred to as `lunar` in code.*** <br>
Some functions of LunarX v0.1.0 Beta are:

```lua
lunar:warn(msg)

Description: Prints a msg in yellow text as an "warning"

Arguments:
msg : string *required

Aliases: none
```
```lua
lunar:success(msg)

Description: Prints a msg in green text as an "success"

Arguments:
msg : string *required

Aliases: none
```
```lua
lunar:error(msg)

Description: Prints a msg in red text as an "error"

Arguements:
msg : string *required

Aliases: lunar:err(msg)
```
```lua
lunar:split(stringToSplit, splitter)

Description: Returns a table that contains invidual arguments accordingly to the seperator, aka splitter

Arguments:
msg : string *required
splitter : string

Aliases: none
```
```lua
lunar:connectTableToString(tableToConnect)

Description: Returns a string comprised of all of your table strings connected together

Arguments:
tableToConnect : table *required

Aliases: lunar:cTTS(tableToConnect)
```
```lua
lunar:run(stringToRun, printSuccess)

Description: Runs the stringToRun using Lua, base Lua functions including LunarX functions supported; printSuccess is an optional argument, prints a success message if the run was successful

Arguments:
stringToRun : string *required
printSuccess : boolean
```
```lua
lunar:wait(secondsToWait)

Description: Pauses code for secondsToWait. Not the most reliable function in the world as it uses os.time(). Update soon!

Arguments:
secondsToWait : number *required
```
```lua
lunar:createFile(fileName, fileSource)

Description: Creates a file with the name of fileName and source of fileSource. File source can be in JavaScript, TypeScript, any language. Not just Lua!

Arguments:
fileName : string *required
fileSource : string *required
```
