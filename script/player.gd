extends CharacterBody2D

signal took_damage 

@export var speed: int = 300
@onready var rocket_container = $RocketContainer

var rocket_scene: PackedScene = preload("res://scenes/rocket.tscn")
var is_shot: bool = true

func _physics_process(delta: float) -> void:
	player_movement()
	screen_limit()
	shot()
	
func player_movement() -> void:
	velocity = Vector2.ZERO
	if Input.is_key_pressed(KEY_W):
		velocity.y = -speed
	if Input.is_key_pressed(KEY_S):
		velocity.y = speed
	if Input.is_key_pressed(KEY_A):
		velocity.x = -speed
	if Input.is_key_pressed(KEY_D):
		velocity.x = speed
		
	move_and_slide()

func screen_limit() -> void:
	var screen_size = get_viewport_rect().size
	var minVectorPosition = Vector2.ZERO
	global_position = global_position.clamp(minVectorPosition, screen_size)

func shot() -> void:
	if Input.is_key_pressed(KEY_SPACE) and is_shot:
		is_shot = false
		var rocket_instance = rocket_scene.instantiate()
		rocket_instance.global_position = Vector2(global_position.x + 60, global_position.y)
		rocket_container.add_child(rocket_instance)
		await get_tree().create_timer(0.25).timeout
		is_shot = true

func take_damage() -> void:
	emit_signal("took_damage")
