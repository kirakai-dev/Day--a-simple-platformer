extends Area2D
@onready var timer: Timer = $Timer
@onready var die: AudioStreamPlayer2D = $Die


func _on_body_entered(body):
	
	print("YOU DIED!!") 
	Engine.time_scale = 0.5
	die.play()
	body.get_node("CollisionShape2D").queue_free()
	body.get_node("Camera2D/Wasted").visible = true
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
