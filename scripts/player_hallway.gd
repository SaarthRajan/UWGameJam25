extends CharacterBody3D

# Constants
const PACE = 2 # Set to 1 for normal speed
const SPEED = (50.0) * PACE

# Variables
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	
	# Gravity.
	if not is_on_floor():
		velocity.y -= (gravity * delta) * PACE
	
	# Rotation
	var input_dir = Input.get_axis("Move_Left", "Move_Right")
	if input_dir:
		rotate_y(PACE * (delta * -input_dir))
	
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
			$HUD/ActionBackground.visible = true
			
			if Input.is_action_just_pressed("Action_Button"):
				print("Door101")
				
		elif collider.name == "Door102":
			
			$"HUD/ACTION".set_text("""
			ROOM 102
			PRESS ENTER TO GO IN
			""")
			$HUD/ActionBackground.visible = true
			
			if Input.is_action_just_pressed("Action_Button"):
				print("Door102")
				
		elif collider.name == "Door103":
			
			$"HUD/ACTION".set_text("""
			ROOM 103
			PRESS ENTER TO GO IN
			""")
			$HUD/ActionBackground.visible = true
			
			if Input.is_action_just_pressed("Action_Button"):
				print("Door103")
				
		elif collider.name == "Door104":
			
			$"HUD/ACTION".set_text("""
			ROOM 104
			PRESS ENTER TO GO IN
			""")
			$HUD/ActionBackground.visible = true
			
			if Input.is_action_just_pressed("Action_Button"):
				print("Door104")
			
		elif collider.name == "DoorCommons":
			
			$"HUD/ACTION".set_text("""
			Commons
			PRESS ENTER TO GO IN
			""")
			$HUD/ActionBackground.visible = true
			
			if Input.is_action_just_pressed("Action_Button"):
				print("DoorCommons")
			
		else:
			
			$"HUD/ACTION".set_text("")
			$HUD/ActionBackground.visible = false
			
	else:
		
		$"HUD/ACTION".set_text("")
		$HUD/ActionBackground.visible = false
		
