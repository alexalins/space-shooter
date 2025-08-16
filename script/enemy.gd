extends Area2D

signal give_points(points: int)

@export var speed: int = 300
@export var points: int = 10

func _process(delta: float) -> void:
	global_position.x -= (speed * delta)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	die()

func _on_body_entered(body: Node2D) -> void:
	print("colidiu")
	body.take_damage()
	die()

func  die() -> void:
	emit_signal("give_points", points)
	queue_free()
