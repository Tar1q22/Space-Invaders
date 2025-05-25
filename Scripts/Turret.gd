extends Node2D
var scene = preload("res://Scenes/Bullet.tscn")
var bullet
var speed: float = 0
var maxSpeed: int = 10
var accel: float = 0.1
var decel: float = 0.2


# Called when the node enters the scene tree for the first time.
func _ready():
	#place in the bottom middle of the window
	position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y-$Area2D/CollisionShape2D.shape.size.y/2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x += Input.get_axis("Left", "Right")*5
	if Input.is_action_just_pressed("Fire"):
		bullet = scene.instantiate()
		bullet.position = position
		add_sibling(bullet)
