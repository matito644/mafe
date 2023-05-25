extends Area2D
@onready var enemy = $Enemy


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(area:):
	enemy.take_damage()
	
