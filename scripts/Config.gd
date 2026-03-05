extends Node

var cfg := ConfigFile.new()

const DEFAULT_PATH := "res://config/config.default.cfg"
const USER_PATH := "user://config.cfg"

func _ready() -> void:
	load_config()

func load_config() -> void:
	# 1) Si no existe config en user://, lo creamos copiando el default
	if not FileAccess.file_exists(USER_PATH):
		var default_cfg := ConfigFile.new()
		var err = default_cfg.load(DEFAULT_PATH)
		if err != OK:
			push_error("No se pudo cargar config.default.cfg: %s" % err)
			return
		default_cfg.save(USER_PATH)

	# 2) Cargar config del usuario (user://config.cfg)
	var err2 = cfg.load(USER_PATH)
	if err2 != OK:
		push_error("No se pudo cargar config de usuario: %s" % err2)

func get_value(section: String, key: String, fallback = null):
	return cfg.get_value(section, key, fallback)

# Helpers para usarlo fácil desde cualquier script
func game_start_delay() -> float:
	return float(get_value("game", "start_delay", 2.0))

func game_mob_spawn_wait() -> float:
	return float(get_value("game", "mob_spawn_wait", 0.5))

func game_score_interval() -> float:
	return float(get_value("game", "score_interval", 1.0))

func player_speed() -> float:
	return float(get_value("player", "speed", 400.0))

func mob_min_speed() -> float:
	return float(get_value("mob", "min_speed", 150.0))

func mob_max_speed() -> float:
	return float(get_value("mob", "max_speed", 250.0))

func mob_direction_randomness() -> float:
	return float(get_value("mob", "direction_randomness", PI / 4))