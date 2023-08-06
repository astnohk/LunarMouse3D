extends Node3D

var screen_material: ShaderMaterial
const enabled_keys_list = [
	"1",
	"2",
	"Delete",
	"Enter",
]


# Called when the node enters the scene tree for the first time.
func _ready():
	var screen: MeshInstance3D = get_node("Monitor/Sphere")
	screen_material = screen.get_surface_override_material(0)
	var viewport: SubViewport = get_node("SubViewport")
	screen_material.set_shader_parameter("screen", viewport.get_texture())
	# Keyboard
	connect_keyboards()

func connect_keyboards():
	var keyboard: Node3D = get_node("Keyboard")
	for keyname in enabled_keys_list:
		print("Key_{key}/Area3D".format({ "key": keyname }))
		var key_instance: Area3D = keyboard.get_node("Key_{key}/Area3D".format({ "key": keyname }))
		var input_event_callback = func(
			_camera: Node,
			event: InputEvent,
			_position: Vector3,
			_normal: Vector3,
			_shape_idx: int):
				self._keyboard_input_event(keyname, event)
		key_instance.connect(
			"input_event",
			input_event_callback)

func _keyboard_input_event(keyname: String, event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			get_node("Keyboard/KeySoundPlayer").play()
			var screen: Control = get_node("SubViewport/Control")
			if keyname == "Enter":
				screen.input_character("\n")
			elif keyname == "Delete":
				screen.input_character("\b")
			else:
				screen.input_character(keyname)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
