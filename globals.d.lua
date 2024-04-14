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

-- FileSystem, basically the same as fs?
type FileSystemObject = {
	pwd: "/",
	readdir: (self: FileSystemObject, path: string) -> { string },
	chdir: (arg1: any, arg2: any) -> (), -- Broken?
	copy: (self: FileSystemObject, from: string, to: string) -> (),
	exists: (self: FileSystemObject, path: string) -> (),
	filename: (path: string) -> string,
	join: (...string) -> string,
	mkdir: (self: FileSystemObject, path: string) -> (),
	mklink: (arg1: any, arg2: any, arg3: any) -> (),
	moveMerge: (arg1: any, arg2: any, arg3: any) -> (),
	parentdir: (path: string) -> string,
	-- pwd: (arg1: any) -> (), -- wut
	readfile: (self: FileSystemObject, path: string) -> string,
	rename: (arg1: any, arg2: any, arg3: any) -> (),
	resolve: (arg1: any, arg2: any) -> (),
	separator: "/",
	split: (path: string) -> { string },
	unlink: (arg1: any, arg2: any) -> (),
	writefile: (self: FileSystemObject, path: string, contents: any) -> (),
}

type Folder = {[string]: FileNode?};
type FileNode = string | Folder;

declare FileSystem: {
	new: (files: Folder?) -> FileSystemObject
}

type fs = typeof(require("fs"))

-- NOTE: fs type isn't working here...
type RawFileSystem = {
	Device: (arg1: any, arg2: any) -> (),
	Directory: (arg1: any, arg2: any, arg3: any) -> (),
	File: (arg1: any, arg2: any) -> (),
	Link: (arg1: any, arg2: any) -> (),
	Root: (arg1: any, arg2: any) -> (),
	SYSTEM_NOACCESS: {
		permissions: {
			owner: "system";
			read: false;
			write: false
		} 
	},
	SYSTEM_READONLY: {
		permissions: {
			owner: "system";
			read: true;
			write: false
		}
	},
	read: (self: RawFileSystem, fs: fs, path: string) -> (),
	readlink: (arg1: any, arg2: any, arg3: any, arg4: any) -> (),
	write: (self: RawFileSystem, fs: fs, path: string, contents: string, arg5: any) -> (),
}

declare RawFileSystem: RawFileSystem