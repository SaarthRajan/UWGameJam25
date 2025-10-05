extends Node

var player_name: String = ""
var current_day: int = 1
var scene: int = 3 # TODO change to 1
signal day_changed(new_day: int)

var put_bags_away: bool = false
var has_knocked_102: bool = false
var has_knocked_103: bool = false
var has_knocked_104: bool = false
var friend: String = ""

# tracker for rooms visited, key = day number
var visited_rooms = {
	1: {"Room102": false, "Room103": false, "Room104": false, "OwnRoom": false},
	2: {"Room102": false, "Room103": false, "Room104": false, "OwnRoom": false},
	3: {"Room102": false, "Room103": false, "Room104": false, "OwnRoom": false}
}

func can_enter_room_101() -> bool:
	return true

func can_enter_room_102() -> bool:
	return has_knocked_102

# you just never go into valter's room
func can_enter_room_103() -> bool:
	return false

#same as 102
func can_enter_room_104() -> bool:
	return has_knocked_104
		
# on day 1, cannot directly go to cafe
func can_enter_cafeteria() -> bool:
	if current_day == 1 and not put_bags_away:
		return false
	else:
		return true
