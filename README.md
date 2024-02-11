# autopilot.lua

## Fork Additions

- Every part type is global and prefixed with 'PilotLua<PartName>'
- Some types were fixed/updated
- Some string lists such as `PilotLuaPartList` are global now. You can use them to have autocomplete for your own functions
```lua
local function SearchPorts(partName: PilotLuaPartList | string, errorIfNotFound: boolean?, maxPortNumber: number?): PilotLuaPart & any	
    ...
end
```

- `pilot.yml` file for selene so it stops crying 😡
