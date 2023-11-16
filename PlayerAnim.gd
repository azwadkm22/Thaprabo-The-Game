extends KinematicBody2D

signal health_updated(health)


const UP = Vector2(0, -1)
const GRAVITY = 15
const MAXFALLSPEED = 200
const MAXSPEED = 80
const JUMPFORCE = 300
const ACCELARATION = 13

var motion = Vector2()
var facingRight = true
var state = MOVE
var prevLeft = true
onready var isEnraged = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#Health
const MaxHealth = 100
var health = MaxHealth	
enum {
	MOVE,
	JUMP,
	ATTACK
}

onready var animPlayer= $AnimationPlayer
onready var animTree = $AnimationTree
# Called when the node enters the scene tree for the first time.
func _ready():
	animTree.active = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
	
	
func move_state(delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	if motion.x > MAXSPEED:
		motion.x = MAXSPEED
	
	if facingRight == true:
		$Sprite.scale.x = 1
		
	else:
		$Sprite.scale.x = -1
	
	if Input.is_action_pressed("Right"):
		motion.x += ACCELARATION
		facingRight = true
		$AnimationPlayer.play("Running")
	elif Input.is_action_pressed("Left"):
		motion.x += -ACCELARATION
		facingRight = false
		$AnimationPlayer.play("Running")
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		$AnimationPlayer.play("Idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			motion.y = -JUMPFORCE
			
	if !is_on_floor():
		if motion.y < 0:
			$AnimationPlayer.play("Jumping")
		else:
			$AnimationPlayer.play("Falling")
	motion = move_and_slide(motion,UP)
	
		
	if Input.is_action_just_pressed("Dash"):
		#TRYING JUMP ATTACK
		#if is_on_floor():
		if facingRight==true:
			position.x += 25
			
		
		if facingRight==false:
			position.x -= 25
			


	
	pass
	
	
func jump_state(delta):
	pass

