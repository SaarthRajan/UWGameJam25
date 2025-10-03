extends CharacterBody3D

# Constants
const SPEED = 50.0

# Variables
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	var input_dir = Input.get_axis("Move_Left", "Move_Right")
	if input_dir:
		rotate_y(delta * -input_dir)
	else:
		rotate_y(0)
	
	var move = Input.get_axis("Move_Down", "Move_Up")

	if move:
		var forward_dir = transform.basis.x
		velocity.x = forward_dir.x * move * SPEED
		velocity.z = forward_dir.z * move * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
