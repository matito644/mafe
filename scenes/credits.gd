extends Control

@onready var back = $back

func _ready():
	back.pressed.connect(_on_back_pressed)

func _on_back_pressed():
	hide()
	
