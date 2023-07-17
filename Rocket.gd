extends RigidBody3D

const MaxThrusterPower = 5.0
const ThrustBaseDirection = Vector3(0.0, 1.0, 0.0)
var Thrust = 300.0
var Force = Vector3(0, 0, 0)

# Mouse Event
var MousePressed = false
var MouseStartPosition = Vector2(0, 0)
var Direction = Vector2(0, 0)
const DirectionCoeff = 0.0005


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Direction = get_viewport().get_mouse_position() - MouseStartPosition
	if Input.is_action_pressed("Throttle"):
		Force = self.global_transform.basis.y * Thrust
	else:
		Force = Vector3(0, 0, 0)
	get_node("FootXp/RigidBody3D").apply_central_force(Force * 0.25 * (1.0 - Direction.x * DirectionCoeff))
	get_node("FootXn/RigidBody3D").apply_central_force(Force * 0.25 * (1.0 + Direction.x * DirectionCoeff))
	get_node("FootZp/RigidBody3D").apply_central_force(Force * 0.25 * (1.0 - Direction.y * DirectionCoeff))
	get_node("FootZn/RigidBody3D").apply_central_force(Force * 0.25 * (1.0 + Direction.y * DirectionCoeff))

# Called when input event fired.
func _input(event):
	if event.is_action_pressed("Throttle"):
		if not MousePressed:
			MousePressed = true
			# Set Start Position
			MouseStartPosition = event.position
	if event.is_action_released("Throttle"):
		MousePressed = false
