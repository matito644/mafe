extends CharacterBody2D


const SPEED = 300.0

const PROYECTIL = preload("res://scenes/proyectil.tscn")
var _explosion_scene = preload("res://scenes/explosions.tscn")
@onready var animation_player = $AnimationPlayer
@onready var hud = $"../HUD"


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
	animation_player.play("move")

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		var disparo = PROYECTIL.instantiate()
		get_parent().add_child(disparo)
		disparo.position = position



const MAX_HP= 100
var hp = 100:
	set(value):
		hp=value
		hud.set_health_player(hp)
	get:
		return hp


func _on_area_2d_area_entered(area):
	if hp > 0:
		hp = max(hp-25, 0)
	if hp == 0:
		var effect := _explosion_scene.instantiate()
		effect.self_modulate = Color(174, 55, 255)
		effect.global_position = global_position
		get_tree().current_scene.add_child(effect)
		#area_enemy.queue_free()
		queue_free()
