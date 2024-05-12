export type Trove = {
	Extend: (self: Trove) -> Trove,
	Clone: <T>(self: Trove, instance: T & Instance) -> T,
	Construct: <T, A...>(self: Trove, class: Constructable<T, A...>, A...) -> T,
	Connect: (self: Trove, signal: SignalLike | RBXScriptSignal, fn: (...any) -> ...any) -> ConnectionLike,
	BindToRenderStep: (self: Trove, name: string, priority: number, fn: (dt: number) -> ()) -> (),
	AddPromise: <T>(self: Trove, promise: T & PromiseLike) -> T,
	Add: <T>(self: Trove, object: T & Trackable, cleanupMethod: string?) -> T,
	Remove: <T>(self: Trove, object: T & Trackable) -> boolean,
	Clean: (self: Trove) -> (),
	AttachToInstance: (self: Trove, instance: Instance) -> RBXScriptConnection,
	Destroy: (self: Trove) -> (),
}

type TroveInternal = Trove & {
	_objects: { any },
	_cleaning: boolean,
	_findAndRemoveFromObjects: (self: TroveInternal, object: any, cleanup: boolean) -> boolean,
	_cleanupObject: (self: TroveInternal, object: any, cleanupMethod: string?) -> (),
}

--[=[
	@within Trove
	@type Trackable Instance | ConnectionLike | PromiseLike | thread | ((...any) -> ...any) | Destroyable | DestroyableLowercase | Disconnectable | DisconnectableLowercase
	Represents all trackable objects by Trove.
]=]
export type Trackable =
	Instance
	| ConnectionLike
	| PromiseLike
	| thread
	| ((...any) -> ...any)
	| Destroyable
	| DestroyableLowercase
	| Disconnectable
	| DisconnectableLowercase

--[=[
	@within Trove
	@interface ConnectionLike
	.Connected boolean
	.Disconnect (self) -> ()
]=]
type ConnectionLike = {
	Connected: boolean,
	Disconnect: (self: ConnectionLike) -> (),
}

--[=[
	@within Trove
	@interface SignalLike
	.Connect (self, callback: (...any) -> ...any) -> ConnectionLike
	.Once (self, callback: (...any) -> ...any) -> ConnectionLike
]=]
type SignalLike = {
	Connect: (self: SignalLike, callback: (...any) -> ...any) -> ConnectionLike,
	Once: (self: SignalLike, callback: (...any) -> ...any) -> ConnectionLike,
}

--[=[
	@within Trove
	@interface PromiseLike
	.getStatus (self) -> string
	.finally (self, callback: (...any) -> ...any) -> PromiseLike
	.cancel (self) -> ()
]=]
type PromiseLike = {
	getStatus: (self: PromiseLike) -> string,
	finally: (self: PromiseLike, callback: (...any) -> ...any) -> PromiseLike,
	cancel: (self: PromiseLike) -> (),
}

--[=[
	@within Trove
	@type Constructable { new: (A...) -> T } | (A...) -> T
]=]
type Constructable<T, A...> = { new: (A...) -> T } | (A...) -> T

--[=[
	@within Trove
	@interface Destroyable
	.disconnect (self) -> ()
]=]
type Destroyable = {
	Destroy: (self: Destroyable) -> (),
}

--[=[
	@within Trove
	@interface DestroyableLowercase
	.disconnect (self) -> ()
]=]
type DestroyableLowercase = {
	destroy: (self: DestroyableLowercase) -> (),
}

--[=[
	@within Trove
	@interface Disconnectable
	.disconnect (self) -> ()
]=]
type Disconnectable = {
	Disconnect: (self: Disconnectable) -> (),
}

--[=[
	@within Trove
	@interface DisconnectableLowercase
	.disconnect (self) -> ()
]=]
type DisconnectableLowercase = {
	disconnect: (self: DisconnectableLowercase) -> (),
}

export type TroveClass = {
	new: () -> Trove,
}

return ... :: TroveClass
