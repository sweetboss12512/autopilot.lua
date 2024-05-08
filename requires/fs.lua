type attributes = {
	permissions: {
		owner: "system",
		read: true,
		write: false,
	},
}

--[[
	# Filesystem
	Thingy for working with the virtual file system
]]
type fs = {
	attributes: attributes,
	kind: "root",
	pwd: "/",
	root: {
		attributes: attributes,
		contents: {
			[string]: {
				attributes: attributes,
				device: { [any]: any } | (...any) -> (),
				kind: "device",
			},
		},

		kind: "directory",
	},

	readdir: (self: fs, path: string) -> { string },
	--- @deprecated Currently broken?
	chdir: (arg1: any, arg2: any) -> (), -- Broken?
	copy: (self: fs, from: string, to: string) -> (),
	exists: (self: fs, path: string) -> (),
	filename: (path: string) -> string,
	join: (...string) -> string,
	mkdir: (self: fs, path: string) -> (),
	--[[ 
		Makes a symlink between the `target` and the `linkpath`
		@param linkPath The target destination of the symlink
		@param target The target destination of the symlink
	]]
	mklink: (self: fs, linkPath: string, target: string) -> (),
	moveMerge: (arg1: any, arg2: any, arg3: any) -> (),
	new: (arg1: any) -> (),
	parentdir: (path: string) -> string,
	-- pwd: (arg1: any) -> (),
	readfile: (self: fs, path: string) -> string,
	rename: (self: fs, path: string, newName: string) -> (),
	resolve: (arg1: any, arg2: any) -> (),
	separator: "/",
	split: (path: string) -> { string },
	unlink: (self: fs, linkPath: string) -> (),
	writefile: (self: fs, path: string, contents: any) -> (),
}

return {} :: fs
