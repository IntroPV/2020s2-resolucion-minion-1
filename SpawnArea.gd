extends Sprite

var max_rombos = 12

onready var Rombo = preload("res://model/Rombo.tscn")

var remaining_rombos = 0

func _ready():
	randomize()
	_populate_rombos()


func _populate_rombos():

	for i in range(0, max_rombos):
		var col_width = texture.get_width()/max_rombos
		var start_col = col_width * i
		var offset = randi() % col_width
		var pos_y = randi() % (texture.get_height() - 100) + 50
		
		var rombo = Rombo.instance()
		add_child(rombo)
		rombo.position = Vector2(start_col+offset, pos_y)
		rombo.connect("fue_comido", self, "_on_rombo_eaten", [rombo])
	
	remaining_rombos = max_rombos	

func _on_rombo_eaten(rombo:Rombo):
	rombo.remove()
	remaining_rombos -= 1
	
	if remaining_rombos == 0:
		_populate_rombos()
