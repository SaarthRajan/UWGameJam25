extends Control

# Replace Placeholder Name with Title
# Change BG Image
# Change Font Style

func _on_play_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_quit_button_up() -> void:
	get_tree().quit()

var current_area
var current_player

func change_scene(scene_path: String, player_scene: String, spawn_pos: Vector3):
	# remove old area
	if current_area:
		current_area.queue_free()

	# load new area
	current_area = load(scene_path).instantiate()
	add_child(current_area)

	# remove old player
	if current_player:
		current_player.queue_free()

	# spawn correct player
	current_player = load(player_scene).instantiate()
	add_child(current_player)
	current_player.global_position = spawn_pos
