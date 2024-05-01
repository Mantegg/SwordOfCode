extends Control

@onready var parallax = $VBoxContainer/ParallaxBackground
var speed = 250
var rotationSpeed = 0.3
var direction = Vector2(-1,1)

#move background
func _process(delta):
	parallax.scroll_offset += direction * speed * delta

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Course/Main/Topic1/1.1.gd")


func _on_btn_back_pressed():
	get_tree().change_scene_to_file("res://UI/MainMenu.tscn")
