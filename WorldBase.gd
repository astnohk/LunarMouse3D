extends Node3D

@export var player_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	reset_player()

func _detect_goal():
	print("Goal.")
	get_node("Panel").visible = true

func _input(event):
	if event.is_action_pressed("Reset"):
		reset_player()

func reset_player():
	# Remove current player
	var player: Node3D = get_node_or_null("Rocket")
	if player:
		self.remove_child(player)
	# Spawn new player
	player = player_scene.instantiate()
	player.name = "Rocket"
	player.global_position = Vector3(0, 0.25, 0)
	add_child(player)
	print("Reset Player.")


func _on_reset_label_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			reset_player()
