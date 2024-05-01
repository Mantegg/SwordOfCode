extends Control

@onready var parallax = $VBoxContainer/ParallaxBackground
var speed = 250
var rotationSpeed = 0.3
var direction = Vector2(-1,1)

func _ready():
	$MarginContainer.offset_bottom = 0
#move background
func _process(delta):
	parallax.scroll_offset += direction * speed * delta

func _on_button_pressed():
	get_tree().change_scene_to_file("res://UI/CodingSpace.tscn")

func _on_btn_back_pressed():
	get_tree().change_scene_to_file("res://UI/SelectLessons.tscn")


func _on_button_2_pressed():
	$MarginContainer/ScrollContainer/VBoxContainer/part2.visible = true
	%answer1.visible = false
	%answer3.visible = false
	%answer4.visible = false
