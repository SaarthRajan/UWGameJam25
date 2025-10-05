extends Node2D


var visited = false
var day_2_done = false

func _ready() -> void:
	if day_2_done:
		return
	if visited and (not day_2_done):
		Global.play_dialogue("res://scripts/timelines/hallway_day2/rowan_MN_revisit.dtl")
		day_2_done = true
	if Global.is_day_2:
		Global.play_dialogue("res://scripts/timelines/hallway_day2/rowan_MN.dtl")
		visited = true
