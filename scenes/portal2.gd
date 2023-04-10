extends Area2D

const PROYECTIL = preload("res://scenes/proyectil.tscn")

func _on_portal_1_portal_shoot():
	var disparo = PROYECTIL.instantiate()
	get_parent().add_child(disparo)
	disparo.position = position
	disparo.rotation = rotation
