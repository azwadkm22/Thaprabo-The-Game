extends Node

func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton2


func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
		if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.ACTION_MODE:
			get_tree().change_scene("res://.import/Starting Cutscene.tscn")
		
		
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()
