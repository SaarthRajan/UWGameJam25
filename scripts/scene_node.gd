class_name SceneNode extends Node2D

var _target_scene: String
var _spawn_point: String
var _tl_path: String
var _next : SceneNode 

func _init(target_scene, spawn_point, tl_path, next):
	_target_scene = target_scene
	_spawn_point = spawn_point
	_tl_path = tl_path
	_next = next
	
