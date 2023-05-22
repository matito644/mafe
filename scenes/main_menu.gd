extends Control

@onready var start = $MarginContainer/VBoxContainer/start
@onready var exit = $MarginContainer/VBoxContainer/exit
@onready var label = $MarginContainer/VBoxContainer/start/Label



func _ready():
	start.pressed.connect(_on_start_pressed)
	exit.pressed.connect(_on_exit_pressed)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_exit_pressed():
	get_tree().quit()
