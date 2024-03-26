extends Button
var game:Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_pressed():
	
	var scene = load("res://Scene1.tscn")
	game = scene.instance()
	add_child(game)
	
	
