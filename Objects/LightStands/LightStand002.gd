extends Node3D

@export var range_rand: float = 0.05


# Called when the node enters the scene tree for the first time.
func _ready():
	var light1: SpotLight3D = get_node("RigidBody3D/SpotLight3D")
	light1.light_color.r = clamp(light1.light_color.r + randf_range(-range_rand, range_rand), 0.0, 1.0)
	light1.light_color.g = clamp(light1.light_color.g + randf_range(-range_rand, range_rand), 0.0, 1.0)
	light1.light_color.b = clamp(light1.light_color.b + randf_range(-range_rand, range_rand), 0.0, 1.0)
