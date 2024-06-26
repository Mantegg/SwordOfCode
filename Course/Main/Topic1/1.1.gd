extends Control

@onready var parallax = $VBoxContainer/ParallaxBackground

@onready var answer1 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ2/MAQ/questions/answer1
@onready var answer2 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ2/MAQ/questions/answer2
@onready var answer3 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ2/MAQ/questions/answer3
@onready var answer4 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ2/MAQ/questions/answer4

var speed = 250
var rotationSpeed = 0.3
var direction = Vector2(-1,1)

func _ready():
	$MarginContainer.offset_bottom = 0
	GlobalAudio.play()

#move background
func _process(delta):
	parallax.scroll_offset += direction * speed * delta

func _on_button_pressed():
	GlobalAudio.playFX("click")
	get_tree().change_scene_to_file("res://Course/Main/Topic1/1.2.tscn")

func _on_btn_back_pressed():
	GlobalAudio.playFX("click")
	get_tree().change_scene_to_file("res://UI/SelectLessons.tscn")



func _on_answer_1_pressed():
	GlobalAudio.playFX("no")

func _on_answer_2_pressed():
	GlobalAudio.playFX("yes")
	$MarginContainer/ScrollContainer/VBoxContainer/part2.visible = true
	answer1.disabled = true
	answer3.disabled = true
	answer4.disabled = true

func _on_answer_3_pressed():
	GlobalAudio.playFX("no")

func _on_answer_4_pressed():
	GlobalAudio.playFX("no")
