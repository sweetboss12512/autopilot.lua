# autopilot.lua

## Fork Additions

- Every part type is a global type and prefixed with 'PilotLua' such as `PilotLuaGyro`
- Some types were fixed/updated
- Some string lists such as `PilotLuaPartList` are global now. You can use them to have autocomplete for your own functions
```lua
local function SearchPorts(partName: PilotLuaPartList | string, errorIfNotFound: boolean?, maxPortNumber: number?): PilotLuaPart & any	
    ...
end
```

- `pilot.yml` file for selene so it stops crying 😡

Paste this in your selene.toml:
```toml
std="pilot"
```
