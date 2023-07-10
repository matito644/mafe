extends MarginContainer

@onready var audio_stream_player_fight = $"../AudioStreamPlayer"
@onready var enemy_texture_progress_bar = $EnemyTextureProgressBar
@onready var enemy = $"../areaEnemy/Enemy"
@onready var audio_stream_player = $AudioStreamPlayer
@onready var player_texture_progress_bar = $PlayerTextureProgressBar
@onready var next_level = $"../CanvasLayer/nextLevel"
@onready var you_lose = $"../CanvasLayer/youLose"
@onready var you_won = $"../CanvasLayer/youWon"

func set_health(value):
	enemy_texture_progress_bar.value = value
	if enemy_texture_progress_bar.value == 0 and player_texture_progress_bar.value > 0:
		await get_tree().create_timer(1.5).timeout
		audio_stream_player_fight.stop()
		audio_stream_player.play()
		next_level.show()

func set_health_player(value):
	player_texture_progress_bar.value = value
	if player_texture_progress_bar.value == 0 and enemy_texture_progress_bar.value > 0:
		await get_tree().create_timer(1.5).timeout
		audio_stream_player_fight.stop()
		audio_stream_player.play()
		you_lose.show()
