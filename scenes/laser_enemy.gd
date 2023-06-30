extends CharacterBody2D

const speed = 500
var direction := Vector2.DOWN
# var velocity = Vector2.RIGHT
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D

func _ready():
	direction = direction.normalized()
	look_at(direction+global_position)
	
func _physics_process(delta):
	var v = direction * speed * delta
	var c:=move_and_collide(v)
	if c and c.get_collider():
		queue_free()


func _on_body_entered(body):
	print("desapareció la weá")
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
