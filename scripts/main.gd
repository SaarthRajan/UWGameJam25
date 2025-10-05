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
			player.SPEED = 0
	

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
