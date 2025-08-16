extends Node2D

@onready var ui = $HUD/UI

var player_points: int = 0
var lifes: int = 3

func _on_spawn_container_spawn_enemy(enemy: Variant) -> void:
	enemy.connect("give_points", on_give_points)
	$SpawnContainer.add_child(enemy)

func on_give_points(points: int) -> void:
	player_points += points
	ui.set_points(player_points)


func _on_player_took_damage() -> void:
	lifes -= 1
	print(lifes)
	ui.set_lifes(lifes)
