extends Control

@onready var parallax = $VBoxContainer/ParallaxBackground
var speed = 250
var rotationSpeed = 0.3
var direction = Vector2(-1,1)

@onready var answer1 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ/MAQ/questions/answer1
@onready var answer2 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ/MAQ/questions/answer2
@onready var answer3 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ/MAQ/questions/answer3
@onready var answer4 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ/MAQ/questions/answer4

@onready var answer21 = $MarginContainer/ScrollContainer/VBoxContainer/part2/MAQ/MAQ/questions/answer1
@onready var answer22 = $MarginContainer/ScrollContainer/VBoxContainer/part2/MAQ/MAQ/questions/answer2
@onready var answer23 = $MarginContainer/ScrollContainer/VBoxContainer/part2/MAQ/MAQ/questions/answer3
@onready var answer24 = $MarginContainer/ScrollContainer/VBoxContainer/part2/MAQ/MAQ/questions/answer4

func _ready():
	$MarginContainer.offset_bottom = 0
#move background
func _process(delta):
	parallax.scroll_offset += direction * speed * delta

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Course/Main/Topic1/CodingSpace.tscn")

func _on_btn_back_pressed():
	get_tree().change_scene_to_file("res://UI/SelectLessons.tscn")

	
func _on_answer_1_pressed():
	$MarginContainer/ScrollContainer/VBoxContainer/part2.visible = true
	answer2.disabled = true
	answer3.disabled = true
	answer4.disabled = true

func _on_answer_2_pressed():
	$MarginContainer/ScrollContainer/VBoxContainer/part3.visible = true
	answer21.visible = false
	answer23.visible = false
	answer24.visible = false
