extends CharacterBody2D

const SPEED = 800.0
const JUMP_VELOCITY = -800.0

#@onready var timer = $Timer  # Assuming Timer is a child node

func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	while true:
		velocity.x = move_toward(velocity.x, randf_range(-3000.0, 3000.0), SPEED)
		move_and_slide()
		await get_tree().create_timer(3000.0).timeout
