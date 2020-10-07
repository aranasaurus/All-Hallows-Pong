extends RigidBody

export var start_pos: Vector3

func _ready() -> void:
	randomize()
	start()

func start():
	set_global_transform(Transform(transform.basis, start_pos))
	apply_central_impulse(Vector3(rand_range(-20.0, 20.0), 0, rand_range(-20.0, 20.0)))
