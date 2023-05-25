extends MarginContainer

@onready var enemy_texture_progress_bar = $EnemyTextureProgressBar

func set_health(value):
	enemy_texture_progress_bar.value = value
