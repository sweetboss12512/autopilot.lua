-- Microcontroller Globals
-- GetPartFromPort and GetPartsFromPort are generated via script
declare GetPort: (port: PilotLuaPortLike) -> PilotLuaPart
declare TriggerPort: (port: PilotLuaPortLike) -> PilotLuaPart

declare SandboxID: string
declare SandboxRunID: number

declare Beep: (pitch: number?) -> ()
declare JSONDecode: (json: string) -> {[string]: any}
declare JSONEncode: (dataToEncode: {[string]: any} | {any}) -> string
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

declare pilot: {
    setInterrupt: (period: number, callback: () -> ()) -> (() -> ()), -- Will repeatedly call the interrupt every period CPU time on a valid resumption time (ignores yields/waits). Returns a function which deletes the interrupt.
    saveRing: (ring: number?) -> (() -> ()), -- Creates a function which elevates the caller to the specified (or current) ring regardless of its privilege. You can use this to de-escalate, spawn a new thread, and then re-escalate your thread after. Requires ring 0 or lower.
    getTimeout: (thread: thread?) -> number, -- Gets the current CPU timeout, or the CPU timeout that the given thread will obey.
    setTimeout: (timeout: number?, thread: thread?) -> (), -- Sets the CPU timeout of the given thread. Requires ring -1 or lower. This will not let you exceed the game's timeout, but will let you set lower timeouts. This has to do with whatever thread happens to be actively running. Currently there is not a way for you to recover from a timeout, so you should use .setInterrupt to handle your own custom timeouts.
    getCPUTime: () -> number, -- Returns the current elapsed CPU time.
    setRing: (ring: number, thread: thread?) -> (), -- Sets the ring of the target (or running) thread. You can use .saveRing to store the current ring so you can escalate again later.
    hasRing: (ring: number, thread: thread?) -> boolean, -- Checks if the target (or running) thread has the specified ring privilege or lower.
    getRing: (thread: thread?) -> number, -- Gets the ring of the target (or running) thread.
    getThreadParent: (thread: thread?) -> thread?, -- Gets the parent of the target (or running) thread. The parent thread must be part of the sandbox and may not exist on a lower ring otherwise nil will be returned.
    claimThread: (thread: thread) -> boolean, -- Sets the thread's parent to the running thread. The target thread must be part of the sandbox and may not exist on a lower ring otherwise nothing will happen.
}

declare RawFileSystem: RawFileSystem