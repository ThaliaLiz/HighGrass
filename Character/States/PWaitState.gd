extends BaseState
export(NodePath) onready var move_state = get_node(move_state) as BaseState

func physics_process(delta : float) -> BaseState:
	player.get_movement_input()
	if player.is_pressing:
		return move_state
	return null
