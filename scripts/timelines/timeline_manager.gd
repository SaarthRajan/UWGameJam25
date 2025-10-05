extends Node

# CONSTS
const SCENE_CAFE: String = "res://scenes/cafeteria.tscn"
const SCENE_ROOM_101: String = "res://scenes/room-101.tscn"
const SCENE_ROOM_102: String = "res://scenes/room-102.tscn"
const SCENE_ROOM_103: String = "res://scenes/room-103.tscn"
const SCENE_ROOM_104: String = "res://scenes/room-104.tscn"
const SCENE_HALLWAY: String = "res://scenes/hallway.tscn"

const TL_3_FDR: String = "res://scripts/timelines/scene_3/"

var scene3_hallway = null

# NODE CONSTRUCT
# SCENE 3

var scene3_caf = SceneNode.new(SCENE_CAFE, "SpawnPoint", TL_3_FDR + "room100_scene3.dtl", scene4_hallway)
var scene3_101 = SceneNode.new(SCENE_ROOM_101, "SpawnPoint", TL_3_FDR + "room101_scene3.dtl", scene3_hallway)
var scene3_102 = SceneNode.new(SCENE_ROOM_102, "SpawnPoint", TL_3_FDR + "room102_scene3.dtl", scene3_hallway)
var scene3_103 = SceneNode.new(SCENE_ROOM_103, "SpawnPoint", TL_3_FDR + "room103_scene3.dtl", scene3_hallway)
var scene3_104 = SceneNode.new(SCENE_ROOM_104, "SpawnPoint", TL_3_FDR + "room104_scene3.dtl", scene3_hallway)

var scene4_hallway = SceneNode.new(SCENE_HALLWAY, "SpawnPoint", TL_3_FDR + "room100_scene3.dtl", null)
