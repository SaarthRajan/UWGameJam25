extends CharacterBody3D


const SPEED = 25.0
const JUMP_VELOCITY = -25.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	var input_dir = Input.get_axis("Move_Left", "Move_Right")
	if input_dir:
		rotate_y(delta * -input_dir)
	else:
		rotate_y(0)
	
	var move = Input.get_axis("Move_Down", "Move_Up")

	if move:
		velocity.x = move * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
