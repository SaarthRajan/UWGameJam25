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
		_animation_player.play("idle_forward")
	else:
		velocity = playerInput * speed
		if playerInput.x > 0:
			_animation_player.play("walk_sideways")
			_animation_player.flip_h = false
		elif playerInput.x < 0:
			_animation_player.play("walk_sideways")
			_animation_player.flip_h = true
		elif playerInput.y > 0:
			_animation_player.play("walk_forward")
		else:
			_animation_player.play("walk_backwards")
	
	move_and_slide()
