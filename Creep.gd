extends KinematicBody2D


#IMPLEMENT A TIMER SO THAT WHEN THE CREEP SEES THE PLAYER IT RUNS AWAY 
#IN THE OTHER DIRECTION AT A FAST SPEED FOR 5 SECONDS

const UP = Vector2(0, -1)
const GRAVITY = 15
const MAXFALLSPEED = 200
const MAXSPEED = 20
const JUMPFORCE = 300
const ACCELARATION = 13

var motion = Vector2()
var facingRight = 1
var is_dead = false

func _ready():
	pass

func dead():
	is_dead = true
	motion = Vector2.ZERO
	$AnimationPlayer.play("Dead")

func _physics_process(delta):
	motion.x = MAXSPEED * facingRight
	$AnimationPlayer.play("Walk")
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	motion = move_and_slide(motion, UP)

		
	if facingRight == 1:
		$Sprite.flip_h = false
		$RayCast2D.rotation_degrees = 270
		
	else:
		$Sprite.flip_h = true
		$RayCast2D.rotation_degrees = 90
		
	if is_on_wall():
		facingRight *= -1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == true:
		$RayCast2D.position.x *= -1
		facingRight *= -1
