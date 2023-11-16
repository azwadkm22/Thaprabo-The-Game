extends Area2D

var SlapDamage = 10

func _on_Slap_body_entered(body):
	if 'Enemy' in body.name:
		body.hit(SlapDamage)
	elif 'Genie' in body.name:
		body.hit(SlapDamage)
	
