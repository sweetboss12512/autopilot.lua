-- Microcontroller Globals
-- GetPartFromPort and GetPartsFromPort are generated via script
declare GetPort: (port: PilotLuaPortLike) -> Part
declare TriggerPort: (port: PilotLuaPortLike) -> Part

declare SandboxID: string
declare SandboxRunID: number

declare Beep: (pitch: number?) -> ()
declare JSONDecode: (json: string) -> {[string]: any}
declare JSONEncode: (dataToEncode: {[string]: any}) -> string
declare Communicate: () -> ()
