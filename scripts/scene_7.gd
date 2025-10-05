extends Node2D

func some_steps():
	$BugGuy.disabled = true
	$Valter.disabled = true
	$MusicNerd.disabled = true
	$PurpleKnight.disabled = true
	
	$BugGuy.visible = false
	$Valter.visible = false
	$MusicNerd.visible = false
	$PurpleKnight.visible = false
	
	$Title.visible = false
	

func _on_bug_guy_button_down() -> void:
	some_steps()


func _on_purple_knight_button_down() -> void:
	some_steps()


func _on_music_nerd_button_down() -> void:
	some_steps()


func _on_valter_button_down() -> void:
	some_steps()
