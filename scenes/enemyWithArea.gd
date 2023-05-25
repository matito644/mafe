extends Area2D
@onready var character_body_2d = $CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered():
	character_body_2d.take_damage()
	
