extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_3_pressed():
	visible = false
	$AudioStreamPlayer.play()


func _on_button_2_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://UI/MainMenu.tscn")

func _on_button_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://UI/SelectLessons.tscn")
