extends Node2D

var alienScene = preload("res://Scenes/alien.tscn")
var alien
var columns: int = 11
var rows: int = 6
var xmargin: int = 400
var ymargin: int = 100
var direction: Vector2 = Vector2(1, 0)
var speed: float = 0.5
@onready var winWidth = get_viewport_rect().size.x

func _ready() -> void:
	_init_aliens()
	
func _physics_process(delta: float) -> void:
	position += speed*direction
	
func _init_aliens():
	for i in range(rows):
		for j in range(columns):
			alien = alienScene.instantiate()
			alien.position = Vector2(xmargin+(j*((winWidth-(xmargin*2))/(columns-1))), ymargin+i*70)
			alien.margin = xmargin-200
			alien.collided.connect(_change_dir)
			alien.incrspeed.connect(_incr_speed)
			add_child(alien)
			
func _change_dir():
	print("collided Recieved")
	direction = direction * Vector2(-1, 0) #Reverse direction
	position.x += direction[0]*10
	position.y += 20
	
func _incr_speed():
	speed+=0.5
