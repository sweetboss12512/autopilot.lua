type options = {
	commentPointerIds: false,
	environment: boolean,
	includeFunctionLocation: false,
	metatables: boolean,
	pointerIds: boolean,
	pretty: boolean,
	robloxClassName: boolean,
	robloxFullName: boolean,
	robloxProperFullName: boolean,
	robloxShortcutServices: boolean,
	sanitizeInvalids: false,
	semicolons: boolean,
	sortKeys: boolean,
	spaces: number,
	stubFunctions: false,
	tabs: boolean,
	trailingSeparator: boolean,
}

--- Returns a pretty printed version of the string
return function(tble: { [any]: any }, options: options?): string
	return nil :: any
end
