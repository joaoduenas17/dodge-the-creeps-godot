extends RigidBody2D

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play()
	var mob_types = anim.sprite_frames.get_animation_names()
	anim.animation = mob_types[randi() % mob_types.size()]

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
