extends PlayerState

@export var duration := 100.0
var timer := 0

func enter(previous_state_path: String, data := {}) -> void:
	player.animation_player.play("dash")
	timer = 0

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	player.velocity.x = player.speed * input_direction_x * 3.0
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	timer += 1
	
	if timer >= duration:
		if player.is_on_floor():
			finished.emit(RUNNING)
		else: finished.emit(FALLING)
	if not player.is_on_floor():
		finished.emit(FALLING)
	elif Input.is_action_just_pressed("move_jump"):
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
