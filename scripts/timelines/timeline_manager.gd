extends Node

# ######## CONSTS
const SCENE_CAFE: String = "res://scenes/cafeteria.tscn"
const SCENE_ROOM_101: String = "res://scenes/room-101.tscn"
const SCENE_ROOM_102: String = "res://scenes/room-102.tscn"
const SCENE_ROOM_103: String = "res://scenes/room-103.tscn"
const SCENE_ROOM_104: String = "res://scenes/room-104.tscn"

const TL_3_FDR: String = "res://scripts/timelines/scene_3"
const TL_8_FDR: String = "res://scripts/timelines/date_murders/"


var scene7 = SceneNode.new(SCENE_ROOM_101, "SpawnPoint", TL_8_FDR + "askDate.dtl", null)
var scene8_pk = SceneNode.new(SCENE_CAFE, "SpawnPoint", TL_8_FDR + "rowan.dtl", null)
var scene8_mn = SceneNode.new(SCENE_CAFE, "SpawnPoint", TL_8_FDR + "musicNerd.dtl", null)
var scene8_bg = SceneNode.new(SCENE_CAFE, "SpawnPoint", TL_8_FDR + "hippie.dtl", null)
var scene8_v = SceneNode.new(SCENE_CAFE, "SpawnPoint", TL_8_FDR + "valter.dtl", null)
