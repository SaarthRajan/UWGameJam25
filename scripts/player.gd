extends CharacterBody2D

@export_range(0, 1000) var speed := 600

@onready var _animation_player = $AnimatedSprite2D
var input: Vector2

func get_input():
	input.x = Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left")
	input.y = Input.get_action_strength("Move_Down") - Input.get_action_strength("Move_Up")
	
	return input.normalized()
	
func _physics_process(delta):
	var playerInput = get_input()
	if playerInput.is_zero_approx():
		velocity = Vector2.ZERO
	else:
		velocity = playerInput * speed
	
	move_and_slide()
