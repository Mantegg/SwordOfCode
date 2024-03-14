extends Control

@onready var parallax = $VBoxContainer/ParallaxBackground
var speed = 250
var rotationSpeed = 0.3
var direction = Vector2(-1,1)

#move background
func _process(delta):
	parallax.scroll_offset += direction * speed * delta

func _on_button_pressed():
	get_tree().change_scene_to_file("res://UI/CodingSpace.tscn")

func _on_btn_back_pressed():
	get_tree().change_scene_to_file("res://UI/SelectLessons.tscn")


func _on_button_2_pressed():
	$MarginContainer/ScrollContainer/VBoxContainer/part2.visible = true
	$MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ/questions/Button.disabled = true
	$MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ/questions/Button3.disabled = true
	$MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ/questions/Button4.disabled = true
