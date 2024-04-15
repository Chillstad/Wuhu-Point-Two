extends CharacterBody3D

@export var speed_multiplyer = 10.0
@export var max_speed = 15.0
var buffer_velocity = 0.0

var input_pitch_dir = 0
var input_roll_dir = 0
var input_thrust_dir = 0

var input_type = "Keyboard"

@export var player_number = 1
@export var camera : Camera3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	if input_type == "Mouse":
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		input_pitch_dir = -event.relative.y * 0.01
		input_roll_dir = -event.relative.x * 0.01
	if Input.is_action_just_released("mouse_throttle_up"):
		input_thrust_dir -= 0.1
	if Input.is_action_just_released("mouse_throttle_down"):
		input_thrust_dir += 0.1
	input_thrust_dir = clamp(input_thrust_dir, -1, 1)
	
	if Input.is_action_just_pressed("settings_toggle"):
		SettingsScreen.visible = true

func _physics_process(delta):
	if not input_type == "Mouse":
		getInput()
	
	#velocity -= Vector3.rotated(new Vector3(0, input_thrust_dir * delta * speed_multiplyer, 0), global_rotation)
	buffer_velocity += (input_thrust_dir * speed_multiplyer * delta)
	
	buffer_velocity = clamp(buffer_velocity, -max_speed, -2)
	

	var buffer_rotation = Vector3(input_roll_dir * delta, 0, input_pitch_dir * delta )
	
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
	global_rotation.y += global_rotation.x * 0.01
	
	velocity = (transform.basis.x * buffer_velocity) + (transform.basis.x * -global_rotation.z * 5)
	

	move_and_slide()

func _on_p1_input_change(new_input_type):
	print("Player 1 input changed")
	if player_number == 1:
		input_type = new_input_type
		
func _on_p2_input_change(new_input_type):
	print("Player 2 input changed")
	if player_number == 2:
		input_type = new_input_type
		
func getInput():
	match input_type:
		"Keyboard":
			input_pitch_dir = Input.get_axis("keyboard_pitch_down", "keyboard_pitch_up")
			input_roll_dir = Input.get_axis("keyboard_roll_right", "keyboard_roll_left")
			input_thrust_dir = Input.get_axis("keyboard_thrust_up", "keyboard_thrust_down")
		"Controller1":
			input_pitch_dir = Input.get_axis("controller1_pitch_down", "controller1_pitch_up")
			input_roll_dir = Input.get_axis("controller1_roll_right", "controller1_roll_left")
			input_thrust_dir = Input.get_axis("controller1_thrust_up", "controller1_thrust_down")
		"Controller2":
			input_pitch_dir = Input.get_axis("controller2_pitch_down", "controller2_pitch_up")
			input_roll_dir = Input.get_axis("controller2_roll_right", "controller2_roll_left")
			input_thrust_dir = Input.get_axis("controller2_thrust_up", "controller2_thrust_down")
