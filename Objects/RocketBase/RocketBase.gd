extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var animation_player: AnimationPlayer = get_node("AnimationPlayer")
	animation_player.current_animation = "Open"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
