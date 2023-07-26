extends Node3D

var animation_player: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player = get_node("AnimationPlayer")
	animation_player.connect("animation_finished", _animation_finished)
	# Start "Open" animation
	animation_player.current_animation = "Open"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _animation_finished(anim_name):
	if anim_name == "Open":
		animation_player.current_animation = "Opening"
	elif anim_name == "Close":
		animation_player.current_animation = "Closing"
