extends KinematicBody2D

const THROW_VELOCITY = Vector2(800, -400)
const GRAVITY = 15
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	var collision = move_and_collide(velocity * delta)
	
	if collision != null:
		_on_impact(collision.normal)

func _on_impact(normal : Vector2):
	velocity = velocity.bounce(normal)
	velocity *= 0.5 + rand_range(-0.05, 0.05)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	
	
	pass # Replace with function body.

func launch(direction):
	var temp = global_transform
	var scene = get_tree().current_scene
	get_parent().remove_child(self)
	scene.add_child(self)
	global_transform = temp
	velocity = THROW_VELOCITY* Vector2(direction, 1)
	set_physics_process(true)
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
