extends Button

@onready var next_scene = preload("res://Scenes/splitscreen.tscn")
@onready var x = preload("res://Scenes/singlescreen.tscn")


func _on_pressed_single_player():
	print("going to 1")
	get_tree().change_scene_to_file("res://Scenes/singlescreen.tscn")

func _on_button_2_pressed():
	print("going to 2")
	get_tree().change_scene_to_file("res://Scenes/splitscreen.tscn")
