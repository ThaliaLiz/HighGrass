class_name StateAnimation
extends BaseState
export(NodePath) onready var animation_tree = get_node(animation_tree)
export(NodePath) onready var player_pivot = get_node(player_pivot)
var on_crouch := 0.0

func set_animation_blend(cur_blend, anim_name : String, is_amount : bool):
	var cur_animation = "parameters/" + anim_name + ("/blend_amount" if is_amount else "/blend_position")
	animation_tree.set(cur_animation, cur_blend)

func crouch(delta : float) -> void:
	var crouch_pressed = Input.is_action_pressed("crouch") and not player.is_pressing_h and not player.is_pressing_v
	on_crouch = lerp(on_crouch, 1 if crouch_pressed else 0, delta * 20)
	set_animation_blend(on_crouch, "feet_to_crouch", true)

func stride(delta : float) -> void:
	var velocity_percent
	var direction_angle = Vector2(player.get_movement_input().y, player.get_movement_input().x).angle()
		
	if player.is_pressing_h:
		velocity_percent = range_lerp(abs(player.velocity.x), 0, player.speed, 0, 1)
		
	elif player.is_pressing_v:
		velocity_percent = range_lerp(abs(player.velocity.y), 0, player.speed, 0, 1)
		
	if player.is_pressing_h or player.is_pressing_v:
		player_pivot.rotation_degrees.y = rad2deg(lerp_angle(deg2rad(player_pivot.rotation_degrees.y), direction_angle, delta * 15))
	
	set_animation_blend(velocity_percent, "idle_to_run", false)
