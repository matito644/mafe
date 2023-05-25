extends CharacterBody2D


const SPEED = 300.0
@onready var animation_player = $AnimationPlayer

func _physics_process(delta):
	animation_player.play("idle")
	
const MAX_HP= 100
var hp = 100:
	set(value):
		hp=value
	get:
		return hp

func take_damage():
	if hp > 0:
		hp = max(hp-15, 0)
	
