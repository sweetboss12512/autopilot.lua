type attributes = {
	permissions: {
		owner: "system",
		read: true,
		write: false,
	},
}

type fs = {
	attributes: attributes,
	kind: "root",
	-- pwd: "/",
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
	-- chdir: (arg1: any, arg2: any) -> (), -- Broken...
	copy: (self: fs, from: string, to: string) -> (),
	exists: (arg1: any, arg2: any) -> (),
	filename: (path: string) -> (),
	join: (...string) -> string,
	mkdir: (self: fs, path: string) -> (),
	mklink: (arg1: any, arg2: any, arg3: any) -> (),
	moveMerge: (arg1: any, arg2: any, arg3: any) -> (),
	new: (arg1: any) -> (),
	parentdir: (path: string) -> string,
	-- pwd: (arg1: any) -> (),
	readfile: (self: fs, path: string) -> string,
	rename: (arg1: any, arg2: any, arg3: any) -> (),
	resolve: (arg1: any, arg2: any) -> (),
	separator: "/",
	split: (path: string) -> { string },
	unlink: (arg1: any, arg2: any) -> (),
	writefile: (self: fs, path: string, contents: any) -> (),
}

return {} :: fs
