extends DampedSpringJoint2D
var staticWall
var attachedThing
var dist
var shrinking = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	staticWall = get_node(self.node_a)
	attachedThing = get_node(self.node_b)
	


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		print("Mouse detected. Length is now " + String.num_int64(self.length))
		shrinking = !shrinking
	#if event.is_action_pressed(&"click"):
		#print("Mouse detected. Length is now " + String.num_int64(self.length))
		#shrinking = !shrinking


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if !shrinking:
		self.length = staticWall.position.distance_to(attachedThing.position)
		self.rest_length = .75 * self.length
	else:
		self.length  = staticWall.position.distance_to(attachedThing.position)/2
		self.rest_length = self.length/2
		print(self.length, self.rest_length)
	#self.rest_length = length/2
	#print(self.length)
