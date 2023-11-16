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
var coins = 0
onready var isEnraged = false

var is_dead = false;
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
#onready var animTree = $AnimationTree
onready var slapHitbox = $Slap/SlapHitbox
onready var slapSprite = $Slap/SlapEffect
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	if $InvulnerabilityTimer.is_stopped() == false:
		$EffectsAnimation.play("Invulnerable")
	if health > MaxHealth:
		health = MaxHealth
	$PlayerHealthBar._on_health_updated(health)
	if is_dead == false:
			
		if isEnraged == true:
			$Enraged.visible = true
			$Slap.SlapDamage = 25
		else:
			$Slap.SlapDamage = 10
			$Enraged.visible = false
		match state:
			MOVE:
				move_state(delta)
			ATTACK:
				attack_state(delta)
			JUMP:
				jump_state(delta)
	
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
					if "Enemy" in get_slide_collision(i).collider.name:
							hit(20)
				
					
	
func hit(damage):
	if $InvulnerabilityTimer.is_stopped():
		$EffectsAnimation.play("Flash")
		$EffectsAnimation.play("Rest")
		$InvulnerabilityTimer.start()
		health = health - damage;
	if health <= 0:
		dead()
	
func move_state(delta):
	slapSprite.visible = false
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
	
	if Input.is_action_just_pressed("Attack"):
		#TRYING JUMP ATTACK
		#if is_on_floor():
		state = ATTACK
		


func attack_state(delta):
	if facingRight != prevLeft:
		prevLeft = facingRight
		slapHitbox.position.x *= -1
		slapSprite.position.x *= -1
	$AnimationPlayer.play("Slap")
	
	#TRYING JUMP ATTACK
	#motion = Vector2.ZERO
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	motion = move_and_slide(motion,UP)
	
	
	pass
	
func attack_done():
	slapHitbox.disabled = true
	state = MOVE
	
	
func jump_state(delta):
	pass

func slap_effect():
	slapSprite.visible = true
	slapHitbox.disabled = false
	
#func slap_hit(body):
#	if "Enemy" in body.type:
#		body.dead()
	
	
func dead():
	is_dead = true
	motion = Vector2.ZERO
	animPlayer.play("Hit")
	$CollisionShape2D.disabled = true
	$DeadTimer.start()


func _on_FallZone_body_entered(body):
	get_tree().change_scene("res://Levels/Title.tscn")

#WIP
#
#func set_health(value):
#	var prev_health = health
#	health = clamp(value)


func _on_Timer_timeout():
	isEnraged = false

func get_enraged():
	isEnraged = true
	$EnragedTimer.start()


func _on_DeadTimer_timeout():
	#var scene = get_tree().current_scene
	get_tree().change_scene("res://Levels/Title.tscn")
	


func _on_EffectTimer_timeout():
	$EffectsAnimation.play("Rest")
	pass # Replace with function body.


func addCoin():
	print($HUD.coins)
	$HUD.coins = $HUD.coins + 1
	pass
