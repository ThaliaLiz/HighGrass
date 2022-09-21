extends BaseState
export(NodePath) onready var wait_state = get_node(wait_state) as BaseState
var movement_value := 0.0

func physics_process(delta:float) -> BaseState:
	if (player.velocity - Vector2.ZERO).length() < 0.000001 and not player.is_pressing:
		return wait_state
	movement(delta)
	return null

func movement(delta:float) -> void:
	player.velocity = run(player.get_movement_input(), delta)

func run(input : Vector2, delta : float) -> Vector2:
	var accel_or_brake = player.accel if player.is_pressing else player.brake
	player.velocity = player.velocity.move_toward(player.speed * input if player.is_pressing else Vector2.ZERO, accel_or_brake * delta)
	return player.move_and_slide(player.velocity)
	
func exit() -> void:
	player.is_pressing = false
