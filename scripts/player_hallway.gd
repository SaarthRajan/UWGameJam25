extends CharacterBody3D

# Constants
const SPEED = 50.0

# Variables
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	
	# Gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Rotation
	var input_dir = Input.get_axis("Move_Left", "Move_Right")
	if input_dir:
		rotate_y(delta * -input_dir)
	
	# Movement
	var move = Input.get_axis("Move_Down", "Move_Up")
	if move:
		# Accelerate
		var forward_dir = transform.basis.x
		velocity.x = forward_dir.x * move * SPEED
		velocity.z = forward_dir.z * move * SPEED
	else:
		# Deccelerate
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	
	if $Camera3D/RayCast3D.is_colliding():
		var collider = $Camera3D/RayCast3D.get_collider()
		if collider.name == "Door101":
			$"HUD/ACTION".set_text("""
			ROOM 101
			PRESS ENTER TO GO IN
			""")
		elif collider.name == "Door102":
			$"HUD/ACTION".set_text("""
			ROOM 102
			PRESS ENTER TO GO IN
			""")
		elif collider.name == "Door103":
			$"HUD/ACTION".set_text("""
			ROOM 103
			PRESS ENTER TO GO IN
			""")
		elif collider.name == "Door104":
			$"HUD/ACTION".set_text("""
			ROOM 104
			PRESS ENTER TO GO IN
			""")
		elif collider.name == "DoorCommons":
			$"HUD/ACTION".set_text("Commons")
		else:
			$"HUD/ACTION".set_text("")
	else:
		$"HUD/ACTION".set_text("")
