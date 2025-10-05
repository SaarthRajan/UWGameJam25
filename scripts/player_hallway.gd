extends CharacterBody3D

# Constants
const PACE = 2 # Set to 1 for normal speed
const SPEED = (50.0) * PACE
const hallway_scene: String = "res://scenes/hallway.tscn"

# Variables
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func actionCard(room: String, action: String, visibility: bool):
	if !visibility:
		$"HUD/ACTION".set_text("")
		$HUD/ActionBackground.visible = false
	else:
		$"HUD/ACTION".set_text("%s\n%s" % [room, action])
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
			handle_door_101()
		elif collider.name == "Door102":
			handle_door_102()
		elif collider.name == "Door103":
			handle_door_103()
		elif collider.name == "Door104":
			handle_door_104()
		elif collider.name == "DoorCommons":
			handle_door_100()
		else:
			actionCard("", "", false)	
	else:
		actionCard("", "", false)
		
# #################### KNOCKING
func knock_door_102():
	Global.has_knocked_102 = true
	# TODO : popup message ??
	
func knock_door_103():
	Global.has_knocked_103 = true
		
func knock_door_104():
	Global.has_knocked_104 = true

# ######################### ENTER ROOM
func enter_room(scene_path: String): # TODO note that you mught have to add a day / 
									# scene counter param to these
									# the following conditionals...
	#if it's scene 3 and user chose to go to room 102:
	if scene_path == "res://scenes/room-102.tscn":
		if (Global.scene_num == 3):
			Global.play_dialogue("res://scripts/timelines/scene_3/room102_scene3.dtl")
			get_tree().root.get_node("Main").load_area(scene_path, "SpawnPoint")
			await get_tree().create_timer(6.0).timeout
			await Global.dialogue_ended
			Global.is_dialogue_active = false
			await get_tree().create_timer(3.0).timeout
			get_tree().root.get_node("Main").load_area(hallway_scene, "SpawnPoint")
			Global.scene_num += 1 # increments scene for future count
	get_tree().root.get_node("Main").load_area(scene_path, "SpawnPoint")

# ####################### DOOR HANDLERS
func handle_door_101():
	actionCard("Room 101 (Your Room)", Global.enter_instruction, true)
	Global.put_bags_away = true
	if Input.is_action_just_pressed("Action_Button"):
			enter_room("res://scenes/room-101.tscn")

func handle_door_102():
	# only has to knock once to gain access forever
	if not Global.has_knocked_102:
		actionCard("Room 102 (Knock)", Global.knock_instruction, true)
		if Input.is_action_just_pressed("Action_Button"):
			knock_door_102()
	else:
		actionCard("Room 102 (Enter)", Global.enter_instruction, true)
		if Input.is_action_just_pressed("Action_Button"):
			enter_room("res://scenes/room-102.tscn")

func handle_door_103():
	# only has to knock once to gain access forever
	if not Global.has_knocked_103:
		actionCard("Room 103 (Knock)", Global.knock_instruction, true)
		if Input.is_action_just_pressed("Action_Button"):
			knock_door_103()
	elif Global.scene_num == 3:
		actionCard("Room 103 (Knock Again)", Global.knock_instruction, true)
		if Input.is_action_just_pressed("Action_Button"):
			Global.play_dialogue("res://scripts/timelines/scene_3/room103_scene3.dtl")
			await get_tree().create_timer(6.0).timeout
			await Global.dialogue_ended
			Global.is_dialogue_active = false
			await get_tree().create_timer(3.0).timeout
			get_tree().root.get_node("Main").load_area(hallway_scene, "SpawnPoint")
			
func handle_door_104():
	if not Global.has_knocked_104:
		actionCard("Room 104 (Knock)", Global.knock_instruction, true)
		if Input.is_action_just_pressed("Action_Button"):
			knock_door_104()
	elif Global.scene_num == 3:
		actionCard("Room 104 (Knock Again)", Global.knock_instruction, true)
		if Input.is_action_just_pressed("Action_Button"):
			Global.play_dialogue("res://scripts/timelines/scene_3/room104_scene3.dtl")
			await get_tree().create_timer(6.0).timeout
			await Global.dialogue_ended
			Global.is_dialogue_active = false
			await get_tree().create_timer(3.0).timeout
			get_tree().root.get_node("Main").load_area(hallway_scene, "SpawnPoint")

# using 100 to represent cafe
func handle_door_100():
	if Global.put_bags_away:
		actionCard("Cafeteria", Global.enter_instruction, true)
		if Input.is_action_just_pressed("Action_Button"):
			enter_room("res://scenes/cafeteria.tscn")
		
	else:
		actionCard("Cafeteria (Locked)", "Put bags into your room before accessing.", true)
