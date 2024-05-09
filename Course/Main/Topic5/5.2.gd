extends Control

@onready var parallax = $VBoxContainer/ParallaxBackground

@onready var answer1 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ/MAQ/questions/answer1
@onready var answer2 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ/MAQ/questions/answer2
@onready var answer3 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ/MAQ/questions/answer3
@onready var answer4 = $MarginContainer/ScrollContainer/VBoxContainer/part1/MAQ/MAQ/questions/answer4

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
	Global.topic2 = true
	get_tree().change_scene_to_file("res://Overworld/Overworld.tscn")

func _on_btn_back_pressed():
	GlobalAudio.playFX("click")
	get_tree().change_scene_to_file("res://Course/Main/Topic5/5.1.tscn")
	
	
func _on_answer_1_pressed():
	GlobalAudio.playFX("no")

func _on_answer_2_pressed():
	GlobalAudio.playFX("no")

func _on_answer_3_pressed():
	GlobalAudio.playFX("yes")
	$MarginContainer/ScrollContainer/VBoxContainer/part2.visible = true
	answer1.disabled = true
	answer2.disabled = true
	answer4.disabled = true
	

func _on_answer_4_pressed():
	GlobalAudio.playFX("no")
