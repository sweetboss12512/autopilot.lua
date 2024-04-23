-- Utility Types
export type PilotLuaPortLike = number | {GUID: string}
type Iterator<K, V> = () -> (K, V)

-- Some literals for autocomplete
export type PilotLuaPartList = "Wood" | "DelayWire" | "Hatch" | "Boiler" | "Extractor" | "BurstLaser" | "Apparel" | "CloningBay" | "Lead" | "BlastingCap" | "Filter" | "Antenna" | "Instrument" | "Teleporter" | "Stick" | "Laser" | "Goo" | "WaterCooler" | "ExoticMatter" | "ReinforcedGlass" | "Explosive" | "Fence" | "Servo" | "DriveBox" | "TimeSensor" | "ElectricFence" | "EnergyBomb" | "Pump" | "Assembler" | "Diode" | "Neon" | "Keyboard" | "Cement" | "StasisField" | "EnergyGun" | "LightBridge" | "Ball" | "Perfectium" | "WirelessButton" | "DarkConverter" | "Disk" | "LightTube" | "LifeSensor" | "SteamTurbine" | "Brick" | "Warhead" | "Transformer" | "Fireworks" | "Cleat" | "Melter" | "PowerCell" | "PlasmaCannon" | "Piston" | "Treads" | "Marble" | "CrudeWing" | "Quartz" | "Primer" | "Microcontroller" | "Plutonium" | "Speaker" | "Cloth" | "Stone" | "SoundMuffler" | "VehicleSeat" | "RoundWedge" | "Winch" | "TriggerWire" | "RTG" | "Transporter" | "Controller" | "Obelisk" | "Motor" | "Aluminum" | "Telescope" | "Spotlight" | "Reactor" | "Prosthetic" | "RoundWedge2" | "Decoupler" | "Snow" | "Heater" | "Tile" | "TriggerSwitch" | "SolarPanel" | "Boombox" | "Igniter" | "DeleteSwitch" | "Electromagnet" | "SpawnPoint" | "Rubber" | "Scrapper" | "Ruby" | "Gun" | "Flamethrower" | "Light" | "Balloon" | "Kiln" | "Glass" | "Sail" | "Rail" | "Beryllium" | "Polysilicon" | "BallastTank" | "Pulverizer" | "Gear" | "Cannon" | "CornerRoundWedge2" | "Tetrahedron" | "Pipe" | "EthernetCable" | "AutomaticLaser" | "Faucet" | "Thruster" | "CombustionTurbine" | "TouchScreen" | "Camera" | "Modem" | "Coal" | "Radar" | "FireWood" | "MiningLaser" | "Container" | "TintedGlass" | "IonRocket" | "Generator" | "Asphalt" | "Ice" | "StarMap" | "Sulfur" | "Coupler" | "Door" | "Cylinder" | "Wedge" | "CornerTetra" | "PlutoniumCore" | "Seat" | "Cone" | "HalfSphere" | "Blade" | "CornerRoundWedge" | "Valve" | "Anchor" | "Screen" | "Truss" | "Freezer" | "Hull" | "Port" | "Handle" | "RemoteControl" | "Cooler" | "Food" | "FloatDevice" | "Railgun" | "RustedMetal" | "Refinery" | "Wing" | "Rocket" | "Flint" | "Button" | "RegionCloaker" | "Tire" | "Artillery" | "Diamond" | "Gold" | "DarkReactor" | "Beacon" | "SolarScoop" | "AirSupply" | "Constructor" | "Iron" | "Rotor" | "Propeller" | "BurnerGenerator" | "Framewire" | "AlienCore" | "EnergyShield" | "Wire" | "TouchSensor" | "StorageSensor" | "Neutronium" | "ImpulseCannon" | "Aerogel" | "Microphone" | "GeigerCounter" | "Hologram" | "ZapWire" | "Turbofan" | "Dispenser" | "Hydroponic" | "TemperatureSensor" | "GravityGenerator" | "Engine" | "Gyro" | "ObjectDetector" | "StudAligner" | "Sign" | "Chute" | "ConveyorBelt" | "Grass" | "Shotgun" | "Titanium" | "DarkMatter" | "Battery" | "Relay" | "Obamium" | "Magnesium" | "Uranium" | "Jade" | "Bin" | "Plastic" | "CornerWedge" | "Copper" | "SteamEngine" | "HyperDrive" | "BlackBox" | "NuclearWaste" | "Heatshield" | "Sand" | "Silicon" | "Switch"
export type ScreenObjectList = "Frame" | "ScrollingFrame" | "ImageLabel" | "TextButton" | "TextLabel"
export type PlanetType = "Desert" | "Terra" | "EarthLike" | "Ocean" | "Tundra" | "Forest" | "Exotic" | "Barren" | "Gas"
export type StarType = "Red" | "Orange" | "Yellow" | "Blue" | "Neutron"
-- ARController elements, Enum.PartType:GetEnumItems()
type Element3DShape = "Ball" | "Block" | "Cylinder" | "Wedge" | "CornerWedge"

-- Microcontroller Types
export type PilotLuaEventConnection = {
    Unbind: (self: PilotLuaEventConnection) -> (),
	Disconnect: (self: PilotLuaEventConnection) -> ()
}
-- The new :Connect().
-- Example: Keyboard.TextInputted:Connect()
export type PilotLuaScriptSignal<T...> = {
	Connect: (self: PilotLuaScriptSignal<T...>, fn: (T...) -> ()) -> PilotLuaEventConnection,
}
export type PilotLuaScreenObject = {
    ChangeProperties: (self: PilotLuaScreenObject, properties: {[string]: any}) -> (),
    AddChild: (self: PilotLuaScreenObject, child: PilotLuaScreenObject) -> (),
    Destroy: (self: PilotLuaScreenObject) -> (),
	Clone: (self: PilotLuaScreenObject) -> PilotLuaScreenObject,
	Parent: PilotLuaScreenObject,
	GetChildren: (self: PilotLuaScreenObject) -> {PilotLuaScreenObject},
	GetDescendants: (self: PilotLuaScreenObject) -> {PilotLuaScreenObject},
	GetPropertyChangedSignal: (self: PilotLuaScreenObject, propertyName: string) -> RBXScriptSignal,
	IsA: (self: PilotLuaScreenObject, className: string) -> boolean,
	[string]: any
}
export type PilotLuaElement3D = {
	Size: Vector3,
	Position: Vector3,
	CFrame: CFrame,
	Color: Color3,
	BrickColor: BrickColor
}
type Cursor = {
    X: number,
    Y: number,
    Player: string,
    Pressed: boolean
}
type ARControllerCursor = {
	Camera: {
		CFrame: CFrame,
		CameraType: Enum.CameraType,
		DiagonalFieldOfView: number,
		FieldOfView: number,
		FieldOfViewMode: Enum.FieldOfViewMode,
		Focus: CFrame,
		HeadScale: number,
		MaxAxisFieldOfView: number,
		NearPlaneZ: number, 
		RenderCFrame: CFrame,
		ViewportSize: Vector2,
		ViewportSizeUI: Vector2,
	},
	Hit: CFrame,
	MouseDelta: Vector2,
	Origin: CFrame,
	Player: string,
	Pressed: boolean,
	ScreenPosition: Vector2,
	Target: PilotLuaPart,
	UnitRay: Ray,
	UserCFrames: {
		Head: CFrame,
		LeftHand: CFrame,
		RightHand: CFrame
	},

	UserId: number,
	UserInput: {
		Gamepad: {
			
		},
		GamepadEnabled: boolean,
		Keyboard: {
			
		},
		KeyboardEnabled: boolean,
		LastInputType: Enum.UserInputType,
		Mouse: {
			{
				Delta: Vector3,
				KeyCode: Enum.KeyCode,
				Position: Vector3,
				UserInputState: Enum.UserInputState,
				UserInputType: Enum.UserInputType
			}
		},
		TouchEnabled: boolean,
		VREnabled: boolean
	},
	VirtualWorldPosition: Vector3,
	WorldPosition: Vector3,
	X: number,
	Y: number
}
export type PilotLuaRegionInfo = {
    Type: "Planet" | "BlackHole" | "Star",
	Subtype: "Desert" | "Terra" | "EarthLike" | "Ocean" | "Tundra" | "Forest" | "Exotic" | "Barren" | "Gas" | "Red" | "Orange" | "Yellow" | "Blue" | "Neutron",
    Name: string,
	Color: Color3,
    TidallyLocked: boolean,
    HasRings: boolean,
    BeaconCount: number,
	Size: number,
	Resources: { string },
    Gravity: number,
    HasAtmosphere: boolean,
	Temperature: number
}
type RegionLog = {
    {
        Event: "HyperDrive" | "Aliens" | "Spawned" | "Death" | "ExitRegion" | "Poison" | "Irradiated" | "Suffocating" | "Freezing" | "Melting",
        Desc: string,
        TimeAgo: number
    }
}

export type CoordinateIterator = Iterator<string, {
	Type: "RedStar" | "OrangeStar" | "BlueStar" | "YellowStar" | "NeutronStar" | "BlackHole"
}>

-- WhenRegionLoads
type SerializedVector3 = {
	X: number,
	Y: number,
	Z: number
}

type SerializedColor3 = {
	R: number,
	G: number,
	B: number
}

export type WhenRegionLoadsData = { -- This may be missing things. - sweetboss151
	EnterLocation: SerializedVector3,
	
	StringCoordinate: string,
	RegionSeed: number,
	RegionType: "Orbit" | "Planet" | "Space",
	Name: string,
	RegionServer: string,
	RegionID: string,
	OrbitBody: {
		EnterLocation: SerializedVector3,
		RegionType: "Orbit" | "Planet",
		Name: string,
		
		StarType: StarType?,
		StarSize: number?,
		
		RegionServer: string,
		RegionID: string,
		StringCoordinate: string,
		Coordinate: {
			InPlanet: boolean
		},
		
		PlanetData: {
			DayCycleIncrement: number,
			EnterLocation: SerializedVector3,
			PlanetType: PlanetType,
			
			PrimaryColor: SerializedColor3,
			SecondaryColor: SerializedColor3,
			StartingTime: number,
			Resources: {string},
			Gravity: number,
			Temperature: number,
			Atmosphere: boolean,
			GenerationHeightScale: number,
			
			PlanetMaterial: string,
			TerrainConfig: {
				Water: boolean,
				Life: boolean,
				
				Slopes: {number},
				Temperature: {number},
				Height: {number},
				RockDensity: {number},
				MountainDensity: {number},
				Roughness: {number}
			}
		}?
	},
	
	Coordinate: {
		InPlanet: boolean
	},
}