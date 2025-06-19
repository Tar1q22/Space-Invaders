extends Node2D
var lastPos = Vector2(100, 100)
var directions: Array = [Vector2(1, 0), Vector2(0, 0)]
var direction: Vector2 = Vector2(1, 0)
var speed: int = 1
var margin: int = 100 # Given by Main
var score = 0
signal collided
signal incrspeed

@onready var area = $Area2D
@onready var shape = $Area2D/CollisionShape2D
@onready var VIEWPORTX = get_viewport_rect().size[0]
@onready var rightBorder: int = VIEWPORTX - margin
@onready var leftBorder: int = margin


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemies")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_collide_with_borders()

func _collide_with_borders():
	#lastPos = position
	var leftedge = global_position.x-shape.get_shape().size.x/2
	var rightedge = global_position.x+shape.get_shape().size.x/2
	if (leftedge <= leftBorder || rightedge >= rightBorder):
		print('collidedemit')
		collided.emit()
		return true
	return false
	#if (area.get_child().get_shape().get_extents().x):
	

func _on_area_2d_area_entered(area):
	if (area.get_parent().is_in_group("Bullets")):
		score+=1
		incrspeed.emit()
		queue_free()
	pass # Replace with function body.
