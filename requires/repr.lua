type options = {
	commentPointerIds: boolean,
	environment: boolean,
	includeFunctionLocation: boolean,
	metatables: boolean,
	pointerIds: boolean,
	pretty: boolean,
	robloxClassName: boolean,
	robloxFullName: boolean,
	robloxProperFullName: boolean,
	robloxShortcutServices: boolean,
	sanitizeInvalids: boolean,
	semicolons: boolean,
	sortKeys: boolean,
	spaces: number,
	stubFunctions: boolean,
	tabs: boolean,
	trailingSeparator: boolean,
}

--- Returns a pretty printed version of the string
return function(tble: { [any]: any }, options: options?): string
	return nil :: any
end
