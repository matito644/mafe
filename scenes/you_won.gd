extends Control

@onready var again = $MarginContainer/VBoxContainer/again
@onready var menu = $MarginContainer/VBoxContainer/menu
@onready var exit = $MarginContainer/VBoxContainer/exit

func _ready():
	again.pressed.connect(_on_again_pressed)
	menu.pressed.connect(_on_menu_pressed)
	exit.pressed.connect(_on_exit_pressed)
	hide()


func _on_again_pressed():
	get_tree().reload_current_scene()
	
func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
