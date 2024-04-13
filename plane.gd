extends CharacterBody3D

@export var speed_multiplyer = 10.0
@export var max_speed = 100.0
var buffer_velocity = 0.0



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# valid inputs are
	# ("pitch_up", "pitch_down", "yaw_left", "yaw_right", "roll_left", "roll_right", "thrust_up", "thrust_down")
	var input_pitch_dir = Input.get_axis("pitch_down", "pitch_up")
	var input_yaw_dir = Input.get_axis("yaw_right", "yaw_left")
	var input_roll_dir = Input.get_axis("roll_right", "roll_left")
	var input_thrust_dir = Input.get_axis("thrust_up", "thrust_down")
	
	#velocity -= Vector3.rotated(new Vector3(0, input_thrust_dir * delta * speed_multiplyer, 0), global_rotation)
	buffer_velocity += (input_thrust_dir * speed_multiplyer * delta)
	velocity = transform.basis.x * buffer_velocity

	
	
	global_rotation.x += input_roll_dir * delta
	global_rotation.y += input_yaw_dir * delta
	global_rotation.z += input_pitch_dir * delta

	

	move_and_slide()
