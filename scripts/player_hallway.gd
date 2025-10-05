extends CharacterBody3D

# Constants
const PACE = 2 # Set to 1 for normal speed
const SPEED = (50.0) * PACE

# Variables
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func actionCard(room: String, visibility: bool):
	if !visibility:
		$"HUD/ACTION".set_text("")
		$HUD/ActionBackground.visible = false
	else:
		$"HUD/ACTION".set_text("""
		%s
		PRESS ENTER TO GO IN
		""" % str(room))
		$HUD/ActionBackground.visible = true

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
			
			actionCard("Room 101", true)
			
			if Input.is_action_just_pressed("Action_Button"):
				get_tree().root.get_node("Main").load_area("res://scenes/room-101.tscn", "SpawnPoint")
				
		elif collider.name == "Door102":
			
			actionCard("Room 102", true)
			
			if Input.is_action_just_pressed("Action_Button"):
				get_tree().root.get_node("Main").load_area("res://scenes/room-102.tscn", "SpawnPoint")
				
		elif collider.name == "Door103":
			
			actionCard("Room 103", true)
			
			if Input.is_action_just_pressed("Action_Button"):
				get_tree().root.get_node("Main").load_area("res://scenes/room-103.tscn", "SpawnPoint")
				
		elif collider.name == "Door104":
			
			actionCard("Room 104", true)
			
			if Input.is_action_just_pressed("Action_Button"):
				get_tree().root.get_node("Main").load_area("res://scenes/room-104.tscn", "SpawnPoint")
			
		elif collider.name == "DoorCommons":
			actionCard("Cafeteria", true)
			
			if Input.is_action_just_pressed("Action_Button"):
				get_tree().root.get_node("Main").load_area("res://scenes/cafeteria.tscn", "SpawnPoint")
			
		else:
			actionCard("", false)
			
	else:
		actionCard("", false)
		
