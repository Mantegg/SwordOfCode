extends Node2D

signal test

func _process(delta):
	test.connect(emitted)
	
func emitted(e):
	get_tree().change_scene_to_file("res://UI/documentation.tscn")
