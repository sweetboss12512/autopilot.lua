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
	},
}

return {} :: fs
