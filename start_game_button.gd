extends Button

@onready var next_scene = preload("res://splitscreen.tscn")
@onready var x = preload("res://main.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_pressed():
	print("changeing scene")
	get_tree().change_scene_to_file("res://main.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://splitscreen.tscn")
