class_name SceneNode extends Node2D

var _target_scene: String
var _tl_path: String
var _next : SceneNode 

func _init(target_scene, tl_path, next):
	_target_scene = target_scene
	_tl_path = tl_path
	_next = next
