class_name PlayerState extends State

const IDLE = "Idle"
const RUNNING = "Running"
const JUMPING = "Jumping"
const FALLING = "Falling"

var player: Player

# Called when the node enters the scene tree for the first time.
func _ready():
	await owner.ready
	player = owner as Player
	assert(player != null, "Null Player, must be child of player scene")
