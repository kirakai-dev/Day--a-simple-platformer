extends AnimatableBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var timer: Timer = $Timer


func _process(delta):
	if ray_cast_up.is_colliding():
		animation_player.play("LevelUp1")
		timer.start

func _on_timer_timout() -> void:
	ray_cast_up.queue_free()
