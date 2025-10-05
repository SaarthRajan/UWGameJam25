class_name SceneNode extends Node2D

var target_scene: String
var tl_path: String
var next : SceneNode 

func _init(target_scene_p: String, tl_path_p: String, next_p: SceneNode):
	target_scene = target_scene_p
	tl_path = tl_path_p
	next = next_p
