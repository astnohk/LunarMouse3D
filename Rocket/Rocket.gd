extends Node3D

@export var fire_parts: PackedScene


const MaxThrusterPower: float = 5.0
const ThrustBaseDirection: Vector3 = Vector3(0.0, 1.0, 0.0)
var Thrust: float = 300.0
var Force: Vector3 = Vector3(0, 0, 0)

# Mouse Event
var MousePressed: bool = false
var MouseStartPosition: Vector2 = Vector2(0, 0)
var Direction: Vector2 = Vector2(0, 0)
const DirectionCoeff: float = 0.0005

var body: RigidBody3D
var previous_position: Vector3 = Vector3(0, 0, 0)
var velocity: Vector3 = Vector3(0, 0, 0)
var accel: Vector3 = Vector3(0, 0, 0)
const ForceThresholdToExplode: float = 30.0

# Called when the node enters the scene tree for the first time.
func _ready():
	body = get_node("Body")
	previous_position = body.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not body:
		return
	# Update camera position
	get_node("CameraPivot").global_position = body.global_position
	# Get the thruster direction	
	Direction = get_viewport().get_mouse_position() - MouseStartPosition
	# Check if the Throttle pressed or not
	var Emitting = false
	if Input.is_action_pressed("Throttle"):
		Force = body.global_transform.basis.y * Thrust
		Emitting = true
	else:
		Force = Vector3(0, 0, 0)
	# Set central force to each booster
	get_node("Body/FootXpHinge/FootXp").apply_central_force(Force * 0.25 * (1.0 - Direction.x * DirectionCoeff))
	get_node("Body/FootXnHinge/FootXn").apply_central_force(Force * 0.25 * (1.0 + Direction.x * DirectionCoeff))
	get_node("Body/FootZpHinge/FootZp").apply_central_force(Force * 0.25 * (1.0 - Direction.y * DirectionCoeff))
	get_node("Body/FootZnHinge/FootZn").apply_central_force(Force * 0.25 * (1.0 + Direction.y * DirectionCoeff))
	# Set particle emitting
	get_node("Body/FootXpHinge/FootXp/Particles3D").emitting = Emitting
	get_node("Body/FootXnHinge/FootXn/Particles3D").emitting = Emitting
	get_node("Body/FootZpHinge/FootZp/Particles3D").emitting = Emitting
	get_node("Body/FootZnHinge/FootZn/Particles3D").emitting = Emitting

func _physics_process(delta):
	if not body:
		return
	# Calculate velocity and accleration
	var v_curr: Vector3 = (body.global_position - previous_position) / delta
	var a_prev: Vector3 = accel
	accel = (v_curr - velocity) / delta
	velocity = v_curr
	if (accel - a_prev).length() > ForceThresholdToExplode:
		print("Explode.")
		explode()

# Called when input event fired.
func _input(event):
	if not body:
		return
	if event.is_action_pressed("Throttle"):
		if not MousePressed:
			MousePressed = true
			# Set Start Position
			MouseStartPosition = event.position
	if event.is_action_released("Throttle"):
		MousePressed = false

func explode():
	var last_position: Vector3 = body.global_position
	remove_child(body)
	body = null
	# Spawn fired parts
	for i in range(128):
		var fire = fire_parts.instantiate()
		var rigid = fire.get_node("RigidBody3D")
		var randV = Vector3((randf() - 0.5) * 2.0, randf(), (randf() - 0.5) * 2.0)
		rigid.apply_central_force(randV * 100 + velocity * 0.5)
		rigid.set_position(last_position + randV * 0.05)
		add_child(fire)
