extends Node3D

@export var rotation_speed = 0.005

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Skeleton3D/polygon0_004.rotation.z += rotation_speed * delta
