extends KinematicBody2D


const UP = Vector2(0, -1)
const GRAVITY = 15
const MAXFALLSPEED = 200
const MAXSPEED = 30
const JUMPFORCE = 300
const ACCELARATION = 13
const MAXHEALTH = 20
const type = "Enemy"

var motion = Vector2()
var facingRight = 1
var is_dead = false

var currentHealth = MAXHEALTH
#var sprite = $Sprite

func _ready():
	$EnemyHealthBar._on_max_health_updated(MAXHEALTH)
	pass

func hit(damage):
	currentHealth = currentHealth - damage
	if currentHealth <= 0:
		dead()
	
func dead():
	is_dead = true
	motion = Vector2.ZERO
	$PikeArea/Pike.disabled = true
	$AnimationPlayer.play("Dead")
	$CollisionShape2D.call_deferred("set_disabled", true)
	$RayCast2D.enabled = false
	$EnemyHealthBar.visible = false
	
	
func _physics_process(delta):
	$EnemyHealthBar._on_health_updated(currentHealth)
	if is_dead==false:
		
		motion.x = MAXSPEED * facingRight
		$AnimationPlayer.play("Walk")
		motion.y += GRAVITY
		if motion.y > MAXFALLSPEED:
			motion.y = MAXFALLSPEED
		motion = move_and_slide(motion, UP)

			
		if facingRight == 1:
			$PikeArea.rotation_degrees = 180
			$Sprite.flip_h = false
		else:
			$PikeArea.rotation_degrees = 0
			$Sprite.flip_h = true

		if is_on_wall():
			facingRight *= -1
			$RayCast2D.position.x *= -1
			
		if $RayCast2D.is_colliding() == false:
			$PikeArea.position.y = rand_range(1, -1)
			$RayCast2D.position.x *= -1
			facingRight *= -1
			
		
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Player" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.hit(20)


func _on_PikeArea_body_entered(body):
	if is_dead == false:
		if 'Player' in body.name:
			body.hit(30)
			print(body.name)
	
