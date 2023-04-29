extends Area2D

const speed = 500
var velocity = Vector2()
@onready var animation_player = $AnimationPlayer


func _process(delta):
	position += transform.y * -speed * delta
	animation_player.play("shoot")
	#velocity.y = -speed * delta
	#translate(velocity)

func _on_body_entered(body):
	queue_free()

