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
}

return {} :: fs
