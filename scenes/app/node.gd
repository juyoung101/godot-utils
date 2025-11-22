extends Node

@onready var sfxplayer = $"/root/AppRoot/SFXPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	sfxplayer.play_effect("card-fan-2.ogg")
	sfxplayer.play_effect("card-fan-2.")
	sfxplayer.play_effect("card-fan-2")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
