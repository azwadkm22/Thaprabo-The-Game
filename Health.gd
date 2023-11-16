extends Node

signal max_changed(new_max)
signal changed(new_health)
signal depleted


func _ready():
	_initialized()

export(int) var max_health = 10 setget set_max
onready var currentHealth = max_health setget set_value


func set_max(new_max):
	max_health = new_max
	max_health = max(1, new_max)
	emit_signal("max_changed", max_health)
	
func set_value(new_health):
	currentHealth = new_health
	currentHealth = clamp(currentHealth, 0, max_health)
	emit_signal("changed", currentHealth)
	
	if currentHealth == 0:
		emit_signal("depleted")
		
		
func _initialized():
	emit_signal("max_changed", max_health)
	emit_signal("changed", currentHealth)


