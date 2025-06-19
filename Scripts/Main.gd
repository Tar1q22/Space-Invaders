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
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Engine.max_fps = 60
	pass
	
