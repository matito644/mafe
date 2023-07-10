extends Area2D
@export var other_portal_path : NodePath
var other_portal : Node2D
@onready var animation_player = $AnimationPlayer
@onready var portal_4 = $"../Portal 4"

signal portal_shoot()

func _physics_process(delta):
	animation_player.play("portal")

func _ready():
	other_portal = get_node_or_null(other_portal_path)
	area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if not is_instance_valid(portal_4):
		return
	area.global_position=portal_4.get_node("Marker2D").global_position
	area.rotation=-portal_4.rotation
	area.modulate= Color.RED
