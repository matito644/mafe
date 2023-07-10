extends Control

@onready var next_level = $MarginContainer/VBoxContainer/nextLevel
@onready var menu = $MarginContainer/VBoxContainer/menu
@onready var exit = $MarginContainer/VBoxContainer/exit

func _ready():
	next_level.pressed.connect(_on_nextLevel_pressed)
	menu.pressed.connect(_on_menu_pressed)
	exit.pressed.connect(_on_exit_pressed)
	hide()

func _on_nextLevel_pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
	
func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
