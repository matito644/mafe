extends MarginContainer

@onready var audio_stream_player_menu = $"../AudioStreamPlayer"
@onready var you_won = $"../CanvasLayer/youWon"
@onready var enemy_texture_progress_bar = $EnemyTextureProgressBar
@onready var enemy = $"../areaEnemy/Enemy"
@onready var audio_stream_player = $AudioStreamPlayer
@onready var player_texture_progress_bar = $PlayerTextureProgressBar
@onready var you_lose = $"../CanvasLayer/youLose"

func set_health(value):
	enemy_texture_progress_bar.value = value
	if enemy_texture_progress_bar.value == 0:
		await get_tree().create_timer(1.5).timeout
		audio_stream_player_menu.stop()
		audio_stream_player.play()
		you_won.show()

func set_health_player(value):
	player_texture_progress_bar.value = value
	if player_texture_progress_bar.value == 0:
		await get_tree().create_timer(1.5).timeout
		audio_stream_player_menu.stop()
		audio_stream_player.play()
		you_lose.show()
