extends Node

# CONSTS
const SCENE_CAFE: String = "res://scenes/cafeteria.tscn"
const SCENE_ROOM_101: String = "res://scenes/room-101.tscn"
const SCENE_ROOM_102: String = "res://scenes/room-102.tscn"
const SCENE_ROOM_103: String = "res://scenes/room-103.tscn"
const SCENE_ROOM_104: String = "res://scenes/room-104.tscn"
const SCENE_HALLWAY: String = "res://scenes/hallway.tscn"

const TL_3_FDR: String = "res://scripts/timelines/scene_3/"
const TL_8_FDR: String = "res://scripts/timelines/date_murders/"

var scene3_hallway = null
var scene6_hallway_first = null
var end_credits = null

# NODE CONSTRUCT
# SCENE 3
var scene3_101 = SceneNode.new(SCENE_ROOM_101, "SpawnPoint", TL_3_FDR + "room101_scene3.dtl", scene3_hallway)
var scene3_102 = SceneNode.new(SCENE_ROOM_102, "SpawnPoint", TL_3_FDR + "room102_scene3.dtl", scene3_hallway)
var scene3_103 = SceneNode.new(SCENE_ROOM_103, "SpawnPoint", TL_3_FDR + "room103_scene3.dtl", scene3_hallway)
var scene3_104 = SceneNode.new(SCENE_ROOM_104, "SpawnPoint", TL_3_FDR + "room104_scene3.dtl", scene3_hallway)
var scene3_caf = SceneNode.new(SCENE_CAFE, "SpawnPoint", TL_3_FDR + "room100_scene3.dtl", scene4_hallway)
# SCENE 4
var scene4_hallway = SceneNode.new(SCENE_HALLWAY, "SpawnPoint", "res://scripts/timelines/scene4.dtl", scene5_main)
# SCENE 5
var scene5_main = SceneNode.new(SCENE_ROOM_101, "SpawnPoint", "scene5.dtl", scene6_hallway_first)
# SCENE 7
var scene7_main = SceneNode.new(SCENE_ROOM_101, "SpawnPoint", TL_8_FDR + "askDate.dtl", null)
# SCENE 8
var scene8_pk = SceneNode.new(SCENE_CAFE, "SpawnPoint", TL_8_FDR + "rowan.dtl", end_credits)
var scene8_mn = SceneNode.new(SCENE_CAFE, "SpawnPoint", TL_8_FDR + "musicNerd.dtl", end_credits)
var scene8_bg = SceneNode.new(SCENE_CAFE, "SpawnPoint", TL_8_FDR + "hippie.dtl", end_credits)
var scene8_v = SceneNode.new(SCENE_CAFE, "SpawnPoint", TL_8_FDR + "valter.dtl", end_credits)
