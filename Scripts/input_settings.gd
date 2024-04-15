extends Node

var input_options = ["Keyboard", "Mouse","Controller_1","Controller_2"]

# Defaults
var player_1_input_device_index = 0
var player_2_input_device_index = 1

# Signals for alerting planes
signal p1_input_change(new_value)
signal p2_input_change(new_value)

# Fire the signals
func setPlayer1(index):
	print("Recieved")
	player_1_input_device_index = index
	p1_input_change.emit(input_options[index])
	emit_signal("p1_input_change", input_options[index])
	
func setPlayer2(index):
	print("Recieved")
	player_2_input_device_index = index
	p2_input_change.emit(input_options[index])
