extends CharacterBody2D

# The code below is auto generated
# To Do
	# Create a Spritesheet - or change the type to sprite and add animationPlayer
	# Add wasd controls based on the game layout

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_pressed("Move_Up"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("Move_Down"):
		velocity.y = SPEED
	else:
		velocity.y = 0

	move_and_slide()
