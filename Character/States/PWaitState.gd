extends StateAnimation
export(NodePath) onready var move_state = get_node(move_state) as BaseState

func physics_process(delta : float) -> BaseState:
	crouch(delta)
	player.get_movement_input()
	if player.is_pressing_h or player.is_pressing_v:
		return move_state
	return null
	

