extends Area2D

@export var target_level: String
@export var spawn_point_name: String
@export var player_scene: String = "res://scenes/Player2D.tscn"

func _on_body_entered(body):
	if body is CharacterBody2D or body is CharacterBody3D:
		print("loading area")
		get_tree().root.get_node("Main").load_area("res://scenes/hallway.tscn", "SpawnPoint")
