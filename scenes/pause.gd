extends Control
@onready var resume = $MarginContainer/VBoxContainer/resume
@onready var retry = $MarginContainer/VBoxContainer/retry
@onready var backmenu = $MarginContainer/VBoxContainer/Backmenu
@onready var audio_stream_player = $AudioStreamPlayer


func _ready():
	resume.pressed.connect(_on_resume_pressed)
	retry.pressed.connect(_on_retry_pressed)
	backmenu.pressed.connect(_on_menu_pressed)
	hide()

func _input(event):
	if event.is_action_pressed("pause"):
		show()
		audio_stream_player.play()
		get_tree().paused = true

func _on_resume_pressed():
	audio_stream_player.stop()
	hide()
	get_tree().paused = false
	
func _on_retry_pressed():
	audio_stream_player.stop()
	get_tree().reload_current_scene()
	get_tree().paused = false
	
func _on_menu_pressed():
	audio_stream_player.stop()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	get_tree().paused = false
