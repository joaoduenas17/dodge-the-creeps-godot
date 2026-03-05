extends Area2D
signal hit

@export var speed = 400
var screen_size

@onready var anim = $AnimatedSprite2D

func _ready():
	screen_size = get_viewport_rect().size
	speed = Config.player_speed()
	hide()

func _process(delta):
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		anim.play()

		if velocity.x != 0:
			anim.animation = "walk"
			anim.flip_v = false
			anim.flip_h = velocity.x < 0
		elif velocity.y != 0:
			anim.animation = "up"
			anim.flip_v = velocity.y > 0
	else:
		anim.stop()

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _on_body_entered(body: Node2D) -> void:
	hide() # Player disappears after being hit.
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
