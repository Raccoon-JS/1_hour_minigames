extends Node

func _ready():
	pass
func _input(event):
	if event.is_action("QUIT"):
		get_tree().quit()
	pass
