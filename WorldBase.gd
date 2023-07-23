extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _detect_goal():
	print("Goal.")
	get_node("Panel").visible = true
