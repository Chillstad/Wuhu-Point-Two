extends Camera3D

@export var move_speed = 1.0
@export var target : Node3D
@export var offset = Vector3.ZERO

func _ready():
	set_as_top_level(true)

func _physics_process(delta):
	if !target:
		return

	var target_xform = target.global_transform.translated_local(offset)
	global_transform = global_transform.interpolate_with(target_xform, move_speed * delta)

	look_at(target.global_transform.origin, Vector3.UP)
	
