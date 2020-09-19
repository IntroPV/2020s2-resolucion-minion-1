extends Node2D

onready var Triangulo = preload("res://model/Triangulo.tscn")

var player:Violeta

func _ready():
	pass # Replace with function body.

func _on_Timer_timeout():
	var triangulo = Triangulo.instance()
	triangulo.player = player
	add_child(triangulo)
