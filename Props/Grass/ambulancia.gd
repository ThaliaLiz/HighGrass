extends StaticBody2D
export (NodePath) onready var win_text = get_node(win_text)
export (NodePath) onready var get_key_text = get_node(get_key_text)
export (NodePath) onready var player = get_node(player)

func _on_Area2D_body_entered(body):
	if body == player:
		if player.has_key:
			if get_key_text.visible:
				get_key_text.visible = false
			win_text.visible = true
		else:
			get_key_text.visible = true
		
