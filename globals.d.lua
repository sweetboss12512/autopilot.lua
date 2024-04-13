-- Microcontroller Globals
-- GetPartFromPort and GetPartsFromPort are generated via script
declare GetPort: (port: PilotLuaPortLike) -> PilotLuaPart
declare TriggerPort: (port: PilotLuaPortLike) -> PilotLuaPart

declare SandboxID: string
declare SandboxRunID: number

declare Beep: (pitch: number?) -> ()
declare JSONDecode: (json: string) -> {[string]: any}
declare JSONEncode: (dataToEncode: {[string]: any}) -> string
declare Communicate: () -> ()

declare Microcontroller: PilotLuaMicrocontroller

-- TODO: Finish this later...
--[[ type FileSystem = {
	chdir: (arg1: any, arg2: any) -> (),
	copy: (arg1: any, arg2: any, arg3: any) -> (),
	exists: (arg1: any, arg2: any) -> (),
	filename: (arg1: any) -> (),
	join: (...any) -> (),
	mkdir: (arg1: any, arg2: any) -> (),
	mklink: (arg1: any, arg2: any, arg3: any) -> (),
	moveMerge: (arg1: any, arg2: any, arg3: any) -> (),
	new: (arg1: any) -> (),
	parentdir: (arg1: any) -> (),
	pwd: (arg1: any) -> (),
	readdir: (arg1: any, arg2: any) -> (),
	readfile: (arg1: any, arg2: any) -> (),
	rename: (arg1: any, arg2: any, arg3: any) -> (),
	resolve: (arg1: any, arg2: any) -> (),
	separator: "/",
	split: (arg1: any) -> (),
	unlink: (arg1: any, arg2: any) -> (),
	writefile: (arg1: any, arg2: any, arg3: any) -> ()
} ]]