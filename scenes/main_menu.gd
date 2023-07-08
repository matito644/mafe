extends Control

@onready var start = $MarginContainer/VBoxContainer/start
@onready var exit = $MarginContainer/VBoxContainer/exit
@onready var label = $MarginContainer/VBoxContainer/start/Label
@onready var credits = $MarginContainer/VBoxContainer/credits
@onready var creditsView = $CanvasLayer/credits

#@onready var audio_stream_player = $AudioStreamPlayer


func _ready():
	start.pressed.connect(_on_start_pressed)
	exit.pressed.connect(_on_exit_pressed)
	credits.pressed.connect(_on_credits_pressed)
	

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
func _on_exit_pressed():
	get_tree().quit()


func _on_credits_pressed():
	creditsView.show()
