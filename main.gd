extends Node

@export var mob_scene: PackedScene

var score: int = 0
var lives: int = 3
var high_score: int = 0
var difficulty_multiplier: float = 1.0

const SAVE_PATH := "user://high_score.save"

func _ready() -> void:
	randomize()

	load_high_score()

	$StartTimer.wait_time = Config.game_start_delay()
	$MobTimer.wait_time = Config.game_mob_spawn_wait()
	$ScoreTimer.wait_time = Config.game_score_interval()

	$HUD.update_score(score)
	$HUD.update_lives(lives)
	$HUD.update_high_score(high_score)

func game_over() -> void:
	$DeathSound.play()
	$Music.stop()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()

func new_game() -> void:
	$Music.play()
	get_tree().call_group("mobs", "queue_free")

	score = 0
	lives = 3
	difficulty_multiplier = 1.0

	$Player.start($StartPosition.position)

	$MobTimer.wait_time = Config.game_mob_spawn_wait()
	$StartTimer.start()

	$HUD.update_score(score)
	$HUD.update_lives(lives)
	$HUD.update_high_score(high_score)
	$HUD.show_message("Get Ready")

func _on_mob_timer_timeout() -> void:
	var mob = mob_scene.instantiate()

	var mob_spawn_location: PathFollow2D = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	var direction = mob_spawn_location.rotation + PI / 2
	mob.position = mob_spawn_location.position

	var r = Config.mob_direction_randomness()
	direction += randf_range(-r, r)
	mob.rotation = direction

	var min_speed = Config.mob_min_speed() * difficulty_multiplier
	var max_speed = Config.mob_max_speed() * difficulty_multiplier

	var velocity = Vector2(randf_range(min_speed, max_speed), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	add_child(mob)

func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)

	if score > high_score:
		high_score = score
		save_high_score()
		$HUD.update_high_score(high_score)

	difficulty_multiplier = 1.0 + (score / 30.0)

	var base_spawn_time = Config.game_mob_spawn_wait()
	var new_spawn_time = max(0.25, base_spawn_time - (score * 0.005))
	$MobTimer.wait_time = new_spawn_time

func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()

func _on_hud_start_game() -> void:
	new_game()

func _on_player_hit() -> void:
	lives -= 1
	$HUD.update_lives(lives)

	if lives > 0:
		$HUD.show_message("Ouch!")
		respawn_player()
	else:
		game_over()

func respawn_player() -> void:
	await get_tree().create_timer(0.2).timeout
	$Player.start($StartPosition.position)
	$Player.set_invulnerable(1.5)

func save_high_score() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_32(high_score)

func load_high_score() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			high_score = file.get_32()
