class_name Player
extends KinematicBody2D

export (float) var speed = 60 * 2
var accel = 1000 * 2.5
var brake = 1000 * 8
var velocity = Vector2.ZERO
var is_pressing = false
var has_key = false

onready var states = $StateManager

func _ready() -> void:
	states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)

func _process(delta: float) -> void:
	states.process(delta)
	
func get_movement_input() -> Vector2:
	var direction_x = Input.get_action_strength("right") - Input.get_action_strength("left")
	var direction_y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	var direction = Vector2(direction_x, direction_y)
	
	is_pressing = true if direction != Vector2.ZERO else false
	
	return direction.normalized()
