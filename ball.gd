extends RigidBody

export var start_pos: Vector3

func _ready() -> void:
	randomize()
	start()

func start():
	set_global_transform(Transform(transform.basis, start_pos))
	apply_central_impulse(Vector3(rand_range(-20.0, 20.0), 0, rand_range(-20.0, 20.0)))

func _integrate_forces(state: PhysicsDirectBodyState) -> void:
	if abs(linear_velocity.x) < 2:
		apply_central_impulse(Vector3(
			-2 if linear_velocity.x < 0 else 2,
			0.0,
			0.0))
