extends Area2D
@export var other_portal_path : NodePath
var other_portal : Node2D
@onready var animation_player = $AnimationPlayer

signal portal_shoot()

func _physics_process(delta):
	animation_player.play("portal")

func _ready():
	other_portal = get_node_or_null(other_portal_path)
	area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	# emit_signal("portal_shoot")
	# print("hay algo")
	if not is_instance_valid(other_portal):
		return
	
	area.global_position=other_portal.get_node("Marker2D").global_position
	area.rotation=-other_portal.rotation
	area.modulate= Color.RED
