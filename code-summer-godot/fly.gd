extends CharacterBody2D



var target = Vector2(0, 0)
var grappled = false
var tongueSpring
const SPEED = 800.0
const JUMP_VELOCITY = -800.0

func _ready():
	#tongueSpring = get_node("tongueSpring")
	pass

func _input(event):
	# Use is_action_pressed to only accept single taps as input instead of mouse drags.
	if event is InputEventMouseButton:
		target = get_global_mouse_position()
		grappled  = true

func _physics_process(delta: float) -> void:
	velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
