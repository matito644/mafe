extends CharacterBody2D


const SPEED = 300.0
@onready var animation_player = $AnimationPlayer
@onready var hud = $"../../HUD"
@onready var player = $"../../Player"
@onready var ray_cast_2d = $RayCast2D
@onready var timer = $Timer
@onready var marker_2d = $Marker2D
@onready var area_enemy = $".."

var _projectile_scene = preload("res://scenes/proyectil_enemigo.tscn")
var _explosion_scene = preload("res://scenes/explosions.tscn")
var _can_fire := true

var rotation_speed = PI
func _physics_process(delta):
	animation_player.play("idle")
	if has_node("../../Player"):
		var v = player.global_position - global_position
		var angle = v.angle()+PI/2
		var r = global_rotation
		var angle_delta = rotation_speed * delta
		angle = lerp_angle(r, angle, 1.0)
		angle = clamp(angle, r-angle_delta, r+angle_delta)
		global_rotation = angle
		var collision_object = ray_cast_2d.get_collider()
		if _can_fire and ray_cast_2d.is_colliding():
			_spawn_projectile()
			_can_fire = false
			timer.start()
		
func _spawn_projectile():
	var direction = Vector2.UP.rotated(global_rotation)
	var projectile = _projectile_scene.instantiate()
	projectile.velocity = direction
	projectile.global_position = marker_2d.global_position
	add_child(projectile)
	
func _on_timer_timeout():
	_can_fire = true
	
const MAX_HP= 100
var hp = 100:
	set(value):
		hp=value
		hud.set_health(hp)
	get:
		return hp

func take_damage():
	if hp > 0:
		hp = max(hp-15, 0)
	if hp == 0:
		var effect := _explosion_scene.instantiate()
		effect.global_position = global_position
		get_tree().current_scene.add_child(effect)
		area_enemy.queue_free()
		queue_free()
	#else: 
	#	queue_free()
#

