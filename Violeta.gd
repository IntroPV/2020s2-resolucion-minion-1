extends Area2D

const SPEED = 200
const DASHING_MULTIPLIER = 3
const DASHING_DURATION = 0.4 #segundos

enum State { FOLLOWING, DASHING }

var state = State.FOLLOWING

var velocity = Vector2.ZERO
var dir_to_target = Vector2.ZERO
var remaining_dash = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	_update_state(delta)

func _update_state(delta):
	var mouse_position = get_global_mouse_position()
	var vec_to_target = (mouse_position - global_position)
	
	match state:
		State.FOLLOWING:
			if vec_to_target.length() > $CollisionShape2D.shape.radius/3:
				look_at(mouse_position)
				dir_to_target = vec_to_target.normalized()
				position += dir_to_target * SPEED * delta
			
			if Input.is_action_just_pressed("ui_accept"):
				_change_state(State.DASHING)
			
		State.DASHING:
			if remaining_dash < 0:
				_change_state(State.FOLLOWING)
			position += dir_to_target * SPEED * DASHING_MULTIPLIER * delta
			remaining_dash -= delta


func _on_new_state(old_state, new_state):
	match new_state:
		State.FOLLOWING:
			pass
			
		State.DASHING:
			remaining_dash = DASHING_DURATION


func _change_state(new_state):
	var old_state = state
	state = new_state
	if old_state != new_state:
		_on_new_state(old_state, new_state)


