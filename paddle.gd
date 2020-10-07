extends KinematicBody

export var speed: float = 10.0
export var player_prefix: = "p1"

var flickered_at: float = 0
var elapsed: float = 0

func _ready() -> void:
	randomize()
	pass

func _physics_process(delta: float) -> void:
	var move = Input.get_action_strength("%s_move_down" % player_prefix) - Input.get_action_strength("%s_move_up" % player_prefix)
	move_and_slide(Vector3(0, 0, move * speed))

func _process(delta: float) -> void:
	elapsed += delta
	if elapsed - flickered_at > rand_range(0.1, 0.4):
		$candleLargegltf/OmniLight.light_energy = rand_range(0.8, 1.2)
		$candleLargegltf2/OmniLight.light_energy = rand_range(0.8, 1.2)
		flickered_at = elapsed
