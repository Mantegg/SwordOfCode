extends Control

@onready var parallax = $ParallaxBackground
var speed = 250
var rotationSpeed = 0.3
var direction = Vector2(-1,0)

#move background
func _process(delta):
	parallax.scroll_offset += direction * speed * delta

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Overworld/Overworld.tscn")

func _on_select_pressed():
	get_tree().change_scene_to_file("res://UI/SelectLessons.tscn")

func _on_quit_pressed():
	get_tree().quit()
