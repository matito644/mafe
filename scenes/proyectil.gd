extends Area2D

const speed = 500
var velocity = Vector2()

func _process(delta):
	velocity.y = -speed * delta
	translate(velocity)

func _on_area_entered(area):
	queue_free()

