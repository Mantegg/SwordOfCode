extends Node2D

signal test

func _ready():
	GlobalAudio.play()

func _process(delta):
	test.connect(emitted)
	
func emitted(e):
	get_tree().change_scene_to_file("res://Course/Main/Topic1/1.1.tscn")
