extends Node2D



func _ready() -> void:
	if Global.scene_4_played:
		print("played scene 5")
		Global.play_dialogue("res://scripts/timelines/scene5.dtl")
		Global.play_dialogue("res://scripts/timelines/hallway_day2/scene6_intro.dtl")
		Global.scene_4_played = false
	
	
	if Global.hippie_day_2_done and Global.rowan_MN_day_2_done and Global.valter_day_2_done:
		Global.play_dialogue("res://scripts/timelines/hallway_day2/scene6_visited.dtl")
