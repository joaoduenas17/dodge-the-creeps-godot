extends Node

@export var mob_scene: PackedScene

var score: int = 0

func _ready() -> void:
	randomize()
	new_game()

func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game() -> void:
	score = 0
	$Player.start($StartPosition.position)

	# Configuración desde el "ambiente" (Config.gd)
	$StartTimer.wait_time = Config.game_start_delay()
	$MobTimer.wait_time = Config.game_mob_spawn_wait()
	$ScoreTimer.wait_time = Config.game_score_interval()

	$StartTimer.start()

func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()

	var mob_spawn_location: PathFollow2D = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	var direction = mob_spawn_location.rotation + PI / 2

	mob.position = mob_spawn_location.position

	var r = Config.mob_direction_randomness()
	direction += randf_range(-r, r)
	mob.rotation = direction

	var velocity = Vector2(randf_range(Config.mob_min_speed(), Config.mob_max_speed()), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	add_child(mob)

func _on_score_timer_timeout() -> void:
	score += 1

func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
