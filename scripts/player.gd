extends CharacterBody2D

# Constants
const SPEED = 300.0

# This is the BASE Player script

# To Do
	# Change the sprite and add animation based on the input/flag

func _physics_process(delta):
	
	# Using this method for easy sprite animation change based on the location
	if Input.is_action_pressed("Move_Up"):
		velocity.y = -SPEED
		velocity.x = move_toward(velocity.x, 0, SPEED)
	elif Input.is_action_pressed("Move_Down"):
		velocity.y = SPEED
		velocity.x = move_toward(velocity.x, 0, SPEED)
	elif Input.is_action_pressed("Move_Left"):
		velocity.x = -SPEED
		velocity.y = move_toward(velocity.y, 0, SPEED)
	elif Input.is_action_pressed("Move_Right"):
		velocity.x = SPEED
		velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
