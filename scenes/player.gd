extends CharacterBody2D


const SPEED = 300.0

const PROYECTIL = preload("res://scenes/proyectil.tscn")


func _physics_process(delta):


	var direction = Input.get_vector("move_left", "move_right", "move_down", "move_up"
	)
	if direction.x:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction.y:
		velocity.y = -direction.y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		var disparo = PROYECTIL.instantiate()
		get_parent().add_child(disparo)
		disparo.position = position

