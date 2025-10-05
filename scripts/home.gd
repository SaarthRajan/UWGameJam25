extends Control

# Replace Placeholder Name with Title
# Change BG Image
# Change Font Style

func _on_play_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/scene_0.tscn")

func _on_quit_button_up() -> void:
	get_tree().quit()
