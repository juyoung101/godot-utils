extends Node

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("app_exit"): get_tree().quit()
