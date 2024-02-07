extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Overworld/Overworld.tscn")

func _on_select_pressed():
	get_tree().change_scene_to_file("res://UI/SelectLessons.tscn")
