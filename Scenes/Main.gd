extends Node2D

var alienScene = preload("res://Scenes/alien.tscn")
var alien
var columns: int = 11
var rows: int = 6
var xmargin: int = 400
var ymargin: int = 100
@onready var winWidth = get_viewport_rect().size.x

# Called when the node enters the scene tree for the first time.
func _ready():
	_init_aliens()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Engine.max_fps = 60
	pass
	
func _init_aliens():
	for i in range(rows):
		for j in range(columns):
			alien = alienScene.instantiate()
			alien.position = Vector2(xmargin+(j*((winWidth-(xmargin*2))/(columns-1))), ymargin+i*70)
			alien.margin = xmargin-200
			add_child(alien)
