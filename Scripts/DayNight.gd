extends DirectionalLight3D
@export var cycle_length = 10 #seconds per rotation

@export var sunlight_color : GradientTexture1D

@onready var sky = $"../WorldEnvironment".environment.sky.sky_material

var cycle_progress = ((rotation.x / (PI)) + 1) / 2 #sunset at 0.5, sunrise at 0, 0-1

func _physics_process(delta):
	rotate_x(2*PI*delta/(cycle_length))
	cycle_progress = ((rotation.x / (PI)) + 1) / 2
	
	light_color = sunlight_color.gradient.sample(cycle_progress)
	
	
	
	
	
