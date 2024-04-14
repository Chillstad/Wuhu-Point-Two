extends CharacterBody3D

@export var speed_multiplyer = 10.0
@export var max_speed = 15.0
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
	
	buffer_velocity = clamp(buffer_velocity, -max_speed, -2)
	

	var buffer_rotation = Vector3(input_roll_dir * delta, input_yaw_dir * delta, input_pitch_dir * delta )
	
	if(buffer_rotation.x != 0):
		global_rotation.x += buffer_rotation.x
	else:
		global_rotation.x = lerp_angle(global_rotation.x, 0, 0.01)
		
		
	if(buffer_rotation.z != 0):
		global_rotation.z = lerp_angle(global_rotation.z , global_rotation.z + buffer_rotation.z, 0.01)
	else:
		global_rotation.z = lerp_angle(global_rotation.z, 0, 0.01)
	
	global_rotation.x = clamp(global_rotation.x + buffer_rotation.x, -PI/3, PI/3)
	global_rotation.z = clamp(global_rotation.z + buffer_rotation.z, -PI/2.5, PI/2.5)
	global_rotation.y += global_rotation.x * 0.005
	
	velocity = (transform.basis.x * buffer_velocity) + (transform.basis.x * -global_rotation.z * 5)
	

	move_and_slide()
	
