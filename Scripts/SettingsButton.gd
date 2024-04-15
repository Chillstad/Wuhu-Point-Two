extends Button

@onready var settings_screen = get_node("/root/SettingsScreen")

func _on_pressed():
	print("Going to settings screen")
	add_child(settings_screen)
	settings_screen.visible = true
