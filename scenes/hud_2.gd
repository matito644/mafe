extends Control

@onready var audio_stream_player_fight = $"../../AudioStreamPlayer"
@onready var player_texture_progress_bar = $MarginContainer/PlayerTextureProgressBar
@onready var enemy_texture_progress_bar = $MarginContainer/VBoxContainer/EnemyTextureProgressBar
@onready var enemy_texture_progress_bar_2 = $MarginContainer/VBoxContainer/EnemyTextureProgressBar2

@onready var next_level = $"../nextLevel"
@onready var you_lose = $"../youLose"
@onready var you_won = $"../youWon"
@onready var enemy = $"../../areaEnemy/Enemy"
@onready var audio_stream_player = $MarginContainer/AudioStreamPlayer

func set_health(value):
	enemy_texture_progress_bar.value = value
	if enemy_texture_progress_bar.value == 0 and enemy_texture_progress_bar_2.value == 0 and player_texture_progress_bar.value > 0:
		await get_tree().create_timer(1.5).timeout
		audio_stream_player_fight.stop()
		audio_stream_player.play()
		you_won.show()

func set_health_player(value):
	player_texture_progress_bar.value = value
	if player_texture_progress_bar.value == 0 and (enemy_texture_progress_bar.value > 0 or enemy_texture_progress_bar_2.value > 0):
		await get_tree().create_timer(1.5).timeout
		audio_stream_player_fight.stop()
		audio_stream_player.play()
		you_lose.show()
		

func set_health_enemy2(value):
	enemy_texture_progress_bar_2.value = value
	if enemy_texture_progress_bar_2.value == 0 and enemy_texture_progress_bar.value == 0 and player_texture_progress_bar.value > 0:
		await get_tree().create_timer(1.5).timeout
		audio_stream_player_fight.stop()
		audio_stream_player.play()
		you_won.show()
