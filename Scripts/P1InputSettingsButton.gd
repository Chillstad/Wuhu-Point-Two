extends OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, InputSettings.input_options.size()):
		add_item(InputSettings.input_options[i], i)
	select(InputSettings.player_1_input_device_index)



func _on_item_selected(index):
	InputSettings.setPlayer1(index)
	
