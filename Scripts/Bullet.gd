extends Node2D
@onready var Hitbox: Node2D = $Hitbox
@onready var HitboxCollision: Node2D = $Hitbox/HitboxCollison
var speed = 64

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.y -= speed
	#print(Hitbox.get_overlapping_areas())
	#Delete if not in view
	if position.y < 0-HitboxCollision.shape.get_size()[1]/2:
		queue_free()




func _on_hitbox_area_entered(area):
	print(area)
	print(area.get_groups())
	if (area.get_parent().is_in_group("Enemies")):
		queue_free()
	pass # Replace with function body.
