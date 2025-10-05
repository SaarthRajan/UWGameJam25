extends Node2D


func _ready():
	await get_tree().create_timer(2.0).timeout
	$AnimationPlayer.play("Start")
	await get_tree().create_timer(22.0).timeout
	get_tree().change_scene_to_file("res://scenes/main.tscn")
