extends Node3D

@export var player_scene: PackedScene

var player: Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node_or_null("Rocket")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	reset_player()

func _process(_delta):
	# Update post process shader's parameter
	var rect: ColorRect = get_node("CanvasLayer/ColorRect")
	var mat: ShaderMaterial = rect.material
	mat.set_shader_parameter("noise_offset", [randf(), randf_range(0.0, 0.2)])
	# Update camera position
	if player:
		var body: RigidBody3D = player.get_node_or_null("Body")
		if body:
			get_node("CameraPivot").global_position = body.global_position

func _detect_goal():
	print("Goal.")
	get_node("CanvasLayer2/Panel").visible = true

func _input(event):
	if event.is_action_pressed("Reset"):
		reset_player()

func reset_player():
	# Remove current player
	self.remove_child(player)
	player = null
	# Spawn new player
	player = player_scene.instantiate()
	player.name = "Rocket"
	player.set_global_position(Vector3(0, 0.25, 0))
	add_child(player)
	print("Reset Player.")

func _on_reset_label_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			reset_player()
