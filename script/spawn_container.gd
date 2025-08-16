extends Node2D

signal spawn_enemy(enemy)
@onready var spawn_position: Node2D = $SpawnPosition

var enemy_scene:PackedScene = preload("res://scenes/enemy.tscn")

func _on_timer_timeout() -> void:
	var spawn_position_array = spawn_position.get_children()
	var random_postion: Node2D = spawn_position_array.pick_random()
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_postion.global_position
	emit_signal("spawn_enemy", enemy_instance)
