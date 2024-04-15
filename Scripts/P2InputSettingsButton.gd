extends OptionButton

@onready var input_settings = get_node("/root/InputSettings")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, input_settings.input_options.size()):
		add_item(input_settings.input_options[i], i)
	select(input_settings.player_2_input_device_index)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_selected(index):
	input_settings.setPlayer2(index)
	
