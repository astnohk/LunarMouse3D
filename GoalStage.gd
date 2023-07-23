extends StaticBody3D


var Colliding = {
	"FootXp": false,
	"FootXn": false,
	"FootZp": false,
	"FootZn": false,
}
var CollidingCount = 0
var Goal = false
var Triggered = false

signal detect_goal()

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("detect_goal", get_tree().get_root().get_node("Root")._detect_goal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(delta):
	if Goal:
		CollidingCount += delta
	else:
		CollidingCount = 0
	if not Triggered and CollidingCount > 3:
		Triggered = true
		detect_goal.emit()

func _on_area_3d_body_entered(body):
	if body.name in Colliding.keys():
		Colliding[body.name] = true
	updateGoal()

func _on_area_3d_body_exited(body):
	if body.name in Colliding.keys():
		Colliding[body.name] = false
	updateGoal()

func updateGoal():
	Goal = true
	for key in Colliding.keys():
		Goal = Goal and Colliding[key]
