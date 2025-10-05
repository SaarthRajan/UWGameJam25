extends Node2D

var visited = false

func _ready() -> void:
	if Global.hippie_day_2_done:
		return
	if visited and (not Global.hippie_day_2_done):
		Global.play_dialogue("res://scripts/timelines/hallway_day2/hippie_revisit.dtl")
		Global.hippie_day_2_done = true
	if Global.is_day_2:
		Global.play_dialogue("res://scripts/timelines/hallway_day2/hippie.dtl")
		visited = true
