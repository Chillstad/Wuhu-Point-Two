extends OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, InputSettings.input_options.size()):
		add_item(InputSettings.input_options[i], i)
	select(InputSettings.player_2_input_device_index)


func _on_item_selected(index):
	print("Item selected for player 2: ")
	print(index)
	InputSettings.setPlayer2(index)
	
