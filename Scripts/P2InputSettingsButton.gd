extends OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, InputSettings.input_options.size()):
		add_item(InputSettings.input_options[i], i)
	select(InputSettings.player_2_input_device_index)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_selected(index):
	InputSettings.setPlayer2(index)
	
