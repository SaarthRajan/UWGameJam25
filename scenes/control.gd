extends Control

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar

func reset_timer():
	texture_progress_bar.value = 0

func _on_timer_timeout():
	texture_progress_bar.value += 1
