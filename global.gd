extends Node

signal dialogue_started
signal dialogue_ended

var current_day: int = 1
var put_bags_away: bool = false
var has_knocked_101: bool = false
var has_knocked_102: bool = false
var has_knocked_103: bool = false
var has_knocked_104: bool = false
var friend: String = ""
var is_dialogue_active: bool = false
var scene_num: int = 3 # TODO switch to 1

var scene_4_played = false
var is_day_2 = false

var hippie_day_2_done = false
var valter_day_2_done = false
var rowan_MN_day_2_done = false

var knock_instruction: String = "PRESS ENTER TO KNOCK"
var enter_instruction: String = "PRESS ENTER TO GO IN"

var killed_by_mn = false
var killed_by_rw = false
var killed_by_valter = false
var killed_by_hippie = false

func start_dialogue():
	print(is_dialogue_active)
	emit_signal("dialogue_started")

func end_dialogue():
	is_dialogue_active = false
	emit_signal("dialogue_ended")

func play_dialogue(dtl: String):
	is_dialogue_active = true
	start_dialogue()
	Dialogic.start(dtl)

func can_enter_room_101() -> bool:
	return true

func can_enter_room_102() -> bool:
	return has_knocked_102

func can_enter_room_103() -> bool:
	return has_knocked_103

func can_enter_room_104() -> bool:
	return has_knocked_104

func can_enter_cafeteria() -> bool:
	return put_bags_away
