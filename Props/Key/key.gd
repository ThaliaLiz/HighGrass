extends Node2D
export(NodePath) onready var player = get_node(player)

func _on_Key_body_entered(body):
	if body == player:
		player.has_key = true
		queue_free()
