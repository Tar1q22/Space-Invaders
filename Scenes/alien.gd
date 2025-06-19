extends Node2D
var lastPos = Vector2(100, 100)
var directions: Array = [Vector2(1, 0), Vector2(0, 0)]
var direction: Vector2 = Vector2(1, 0)
var speed: float = 0.5
var margin: int = 100 # Given by Main
var score = 0

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
	#print(Vector2(1, 0)*Vector2(-1, 0))
	if (_collide_with_borders()):
		print("colliding")
		
	position += direction * speed

func _collide_with_borders():
	var leftedge = position.x-shape.get_shape().size.x/2
	var rightedge = position.x+shape.get_shape().size.x/2
	if (leftedge <= leftBorder || rightedge >= rightBorder):
		if (leftedge <= leftBorder):
			get_parent().get_tree().call_group("Enemies", "_change_dir", leftBorder)
		else:
			get_parent().get_tree().call_group("Enemies", "_change_dir", rightBorder)
		return true
	return false
	#if (area.get_child().get_shape().get_extents().x):
	
func _change_dir(border: int):
	direction = direction * Vector2(-1, 0)
	position.x = border + direction[0]*50
	position.y -= 20
	print(position)
	
func _incr_speed():
	speed += 1

func _on_area_2d_area_entered(area):
	if (area.get_parent().is_in_group("Bullets")):
		score+=1
		get_parent().get_tree().call_group("Enemies", "_incr_speed")
		queue_free()
	pass # Replace with function body.
