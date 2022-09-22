extends StateAnimation
export(NodePath) onready var wait_state = get_node(wait_state) as BaseState

func physics_process(delta:float) -> BaseState:
	if (player.velocity - Vector2.ZERO).length() < 0.000001 and not player.is_pressing_h and not player.is_pressing_v:
		return wait_state
	movement(delta)
	crouch(delta)
	stride(delta)
	return null

func movement(delta : float) -> void:
	player.velocity = run(player.get_movement_input(), delta)

func run(input : Vector2, delta : float) -> Vector2:
	var is_pressing = player.is_pressing_h or player.is_pressing_v 
	var accel_or_brake = player.accel if is_pressing else player.brake
	
	player.velocity = player.velocity.move_toward(player.speed * input if is_pressing else Vector2.ZERO, accel_or_brake * delta)
	
	return player.move_and_slide(player.velocity)
	
func exit() -> void:
	player.is_pressing_h = false
	player.is_pressing_v = false
