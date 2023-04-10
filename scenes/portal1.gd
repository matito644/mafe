extends Area2D

signal portal_shoot()

func _on_area_entered(area):
	emit_signal("portal_shoot")
	
