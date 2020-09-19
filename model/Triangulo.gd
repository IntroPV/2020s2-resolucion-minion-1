extends Area2D

const MAX_SPEED = 60
const ACCEL = 1

var player:Violeta

var velocity = Vector2.ZERO


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var player_pos = player.global_position
	var dir = player_pos - global_position
	velocity += dir * ACCEL * delta
	
	if velocity.length() > MAX_SPEED:
		velocity = velocity.normalized() * MAX_SPEED
	
	position += velocity


func _on_Triangulo_area_shape_entered(area_id, area, area_shape, self_shape):
	get_tree().reload_current_scene()
