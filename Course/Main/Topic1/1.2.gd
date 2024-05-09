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
	GlobalAudio.playFX("click")
	get_tree().change_scene_to_file("res://Course/Main/Topic1/1.3.tscn")

func _on_btn_back_pressed():
	GlobalAudio.playFX("click")
	get_tree().change_scene_to_file("res://Course/Main/Topic1/1.1.tscn")

func _on_answer_3_pressed():
	GlobalAudio.playFX("yes")
	answer1.disabled = false
	answer2.disabled = false
	answer4.disabled = false
	$MarginContainer/ScrollContainer/VBoxContainer/part2.visible = true

func _on_answer_1_pressed():
	GlobalAudio.playFX("yes")
	$MarginContainer/ScrollContainer/VBoxContainer/part3.visible = true
	answer22.disabled = true
	answer23.disabled = true
	answer24.disabled = true

	
