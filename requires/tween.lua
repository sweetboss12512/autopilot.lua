type tween = {
	GetValue: (
		self: tween,
		alpha: number,
		easingStyle: Enum.EasingStyle,
		easingDirection: Enum.EasingDirection
	) -> number,
}

return {} :: tween
