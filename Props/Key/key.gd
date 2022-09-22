extends Node2D
export(NodePath) onready var player = get_node(player)
signal got_key
func _on_Key_body_entered(body):
	if body == player:
		player.has_key = true
		emit_signal("got_key")
		queue_free()
