extends Node3D

var screen_material: ShaderMaterial

# Called when the node enters the scene tree for the first time.
func _ready():
	var screen: MeshInstance3D = get_node("Monitor/Sphere")
	screen_material = screen.get_surface_override_material(0)
	var viewport: SubViewport = get_node("SubViewport")
	screen_material.set_shader_parameter("screen", viewport.get_texture())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
