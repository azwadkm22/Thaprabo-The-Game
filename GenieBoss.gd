extends KinematicBody2D

var state = 0
var attacking = 0
const maxHealth = 200
var currentHealth = maxHealth
var facingLeft = true
var hostile = false
enum {
	IDLE,
	SHOCKWAVE,
	LASER,
	ERUPTION,
	ROCK
}

func _ready():
	$PlayerHealthBar._on_max_health_updated(maxHealth)
	pass

func _physics_process(delta):
	if facingLeft:
		$Sprite.flip_h = true
		$Laser.rotation_degrees = 180
	else:
		$Sprite.flip_h = false
		$Laser.rotation_degrees = 0
		
	$PlayerHealthBar._on_health_updated(currentHealth)
	
	if hostile == true:
		
		if state == LASER:
			laserAttack()
		elif state == SHOCKWAVE:
			shockwaveAttack()
		else:
			pass
	else:
			pass
			
			
func laserAttack():
	if attacking == 0:
		$Laser.position.y = rand_range(-2, 10)
		$Attack.start()
		attacking = 1
		$Attacks.play("Laser")
		$Laser/LaserCollision.disabled = false
		$Laser/LaserSprite.visible = true


func shockwaveAttack():
	if attacking == 0:
		$Attack.start()
		attacking = 1
		$Attacks.play("Shockwave")
		$Shockwave/ShockwaveCollision.disabled = false
		$Shockwave/ShockwaveSprite.visible = true
	
func disableEverything():
	state = 0
	print("Idle")
	$Laser/LaserCollision.disabled = true
	$Laser/LaserSprite.visible = false
	$Shockwave/ShockwaveCollision.disabled = true
	$Shockwave/ShockwaveSprite.visible = false
	$Wait.start()

func _on_Attack_timeout():
	$Attacks.play("Idle")
	$Laser/LaserCollision.disabled = true
	$Laser/LaserSprite.visible = false
	$Shockwave/ShockwaveCollision.disabled = true
	$Shockwave/ShockwaveSprite.visible = false
	$Wait.start()
	
	
func Attack_Timer_Start():
	$Attack.start()


func _on_Wait_timeout():
	attacking = 0
	state = round(rand_range(1, 2))
	print(state)
	pass # Replace with function body.


func _on_Shockwave_body_entered(body):
	if "Player" in body.name:
		body.hit(15)
		print("Shockwave Hit")
	

func _on_Laser_body_entered(body):
	if "Player" in body.name:
		body.hit(15)
		print("Laser Hit")
	
func hit(damage):
	print("So it begins...")
	hostile = true
	$Peace.stop()
	currentHealth = currentHealth - damage
	if  currentHealth <= 0:
		queue_free()


func _on_Peace_timeout():
	print("Win")
	pass # Replace with function body.
