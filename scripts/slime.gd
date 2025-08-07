extends Node2D

var direction = 1
var kills = 0
const speed = 60

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var timer: Timer = $Timer
@onready var collision_shape_2d: CollisionShape2D = $"Kill Zone/CollisionShape2D"



func _process(delta):
	
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * speed * delta
	if ray_cast_up.is_colliding():
		print("+1 Kills")
		kills += 1
		print(kills)
		queue_free()

func _on_timer_timeout() -> void:
	queue_free()
