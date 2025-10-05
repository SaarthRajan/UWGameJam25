extends CharacterBody2D

@export_range(0, 1000) var speed := 300

@onready var _animation_player = $AnimatedSprite2D
var input: Vector2

func _ready():
	$Control.visible = false

func get_input():
	input.x = Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left")
	input.y = Input.get_action_strength("Move_Down") - Input.get_action_strength("Move_Up")
	
	return input.normalized()
	
func start_door_timer():
	$Control.visible = true
	$Control.reset_timer()

func stop_door_timer():
	$Control.visible = false
	
func _physics_process(delta):
	var playerInput = get_input()
	if playerInput.is_zero_approx():
		velocity = Vector2.ZERO 
		_animation_player.play("idle_forward")
	else:
		velocity = playerInput * speed
		if playerInput.x > 0:
			_animation_player.play("walk_right")
			# _animation_player.flip_h = false
		elif playerInput.x < 0:
			_animation_player.play("walk_left")
			# _animation_player.flip_h = true
		elif playerInput.y > 0:
			_animation_player.play("walk_forward")
		else:
			_animation_player.play("walk_backwards")
	
	move_and_slide()
