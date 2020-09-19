extends Area2D

class_name Rombo

signal fue_comido

func remove():
	get_parent().remove_child(self)
	queue_free()

func _on_Rombo_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.is_in_group("Eaters"):
		emit_signal("fue_comido")
