extends Node

var current_area: Node
var player: Node

func _ready():
	# Load the first level
	switch_player("res://scenes/Player3D.tscn")
	load_area("res://scenes/hallway.tscn", "SpawnPoint")
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(str: String):
	if str == "freeze":
		if player is CharacterBody2D:
			player.speed = 0
		else:
			player.SPEED = 0
	elif str == "unfreeze":
		if player is CharacterBody2D:
			player.speed = 400
		else:
			player.SPEED = 100
	
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	
var previous_scene_node = null
var starting_scene_node = SceneNode.new("", "", "", null);
var current_scene_node: SceneNode;

func load_scene_node(scene_node: SceneNode):
	if scene_node is SceneNode:
		previous_scene_node = current_scene_node
		current_scene_node = scene_node
		get_tree().root.get_node("Main").load_area(scene_node._target_scene, scene_node._spawn_point)
		Global.play_dialogue(scene_node._tl_path)
	else:
		print("handle branching")

func _on_timeline_ended(timeline_name):
	print("Timeline ended: ", timeline_name)
	if current_scene_node._next is SceneNode:
		print("Moving on to: ", current_scene_node._next._target_scene)
		load_scene_node(current_scene_node._next)
	elif (current_scene_node._next is String) and (current_scene_node._next == "prev"):
		print("Went back to: ", previous_scene_node)
		load_scene_node(previous_scene_node)
	else:
		print("Branching...")
	
func on_player_interact(door_name):
	if door_name in current_scene_node._branches:
		var visited = current_scene_node._branches[door_name]
		if not visited:
			current_scene_node._branches[door_name][0] = true # mark current branch as visited
			load_scene_node(current_scene_node._branches[door_name][1])
		else:
			load_scene_node(current_scene_node._branches[door_name][2])
	else:
		print("No branch found for this action")

# Load a level with a specific spawn pointwd
func load_area(level_path: String, spawn_name: String):
	# Remove previous area
	print("loading area: ", level_path)
	if current_area:
		print("freeing current area")
		print("area to be freed: ", current_area.name)
		current_area.queue_free()

	# Load new area
	current_area = load(level_path).instantiate()
	print("children: ")
	for child in get_children():
		print(child.name)
	print("")
	add_child(current_area)

	# Position player at spawn point
	var spawn = current_area.get_node_or_null(spawn_name)
	print("spawnpoint detected for current area:", current_area)
	if spawn:
		if spawn is Node2D:
			print("Spawning 2d")
			switch_player("res://scenes/Player2D.tscn")
			player.global_position = spawn.global_position
		elif spawn is Node3D:
			print("Spawning 3d")
			switch_player("res://scenes/Player3D.tscn")
			player.global_transform.origin = spawn.global_transform.origin

# Switch between 2D ↔ 3D players
func switch_player(player_scene: String):
	if player:
		player.queue_free()
		
	player = load(player_scene).instantiate()
	add_child(player)
	print("spawned player")
