extends ColorRect

const brightness_min: float = 0.525
const brightness_max: float = 0.575
const flicker_strength: float = 0.0125

var brightness: float = 0.6

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.material.set_shader_parameter("offset", [randf(), randf()])
	brightness = clampf(
		brightness + randf_range(-1.0 * flicker_strength, flicker_strength),
		brightness_min,
		brightness_max)
	self.material.set_shader_parameter("brightness", brightness)
