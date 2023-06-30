extends Area2D
@onready var enemy = $Enemy

func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(area):
	enemy.take_damage()
	
