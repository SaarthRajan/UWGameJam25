extends Area2D

@export var target_scene: String
@export var spawn_point_name: String
@export var player_scene: String = "res://scenes/Player2D.tscn"
@export var wait_duration: float = 0.5

var _is_wait_cancelled = false

func _on_body_entered(body):
	if body is CharacterBody2D or body is CharacterBody3D:
		_is_wait_cancelled = false
		body.start_door_timer()
		
		var timer = get_tree().create_timer(wait_duration)
		await timer.timeout
		
		if not _is_wait_cancelled:
			get_tree().root.get_node("Main").load_area(target_scene, spawn_point_name)

func _on_body_exited(body):
	if body is CharacterBody2D or body is CharacterBody3D:
		_is_wait_cancelled = true
		body.stop_door_timer()
