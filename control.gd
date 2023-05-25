extends Control


func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$clickthree.play()
	get_tree().change_scene_to_file("res://ui.tscn")


