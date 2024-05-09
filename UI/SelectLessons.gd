extends Control

@onready var parallax = $VBoxContainer/ParallaxBackground
var speed = 250
var rotationSpeed = 0.3
var direction = Vector2(-1,1)

@onready var btnTopic1 = $ScrollContainer/VBoxContainer/Button
@onready var btnTopic2 = $ScrollContainer/VBoxContainer/Button2
@onready var btnTopic3 = $ScrollContainer/VBoxContainer/Button3
@onready var btnTopic4 = $ScrollContainer/VBoxContainer/Button4
@onready var btnTopic5 = $ScrollContainer/VBoxContainer/Button5

func _ready():
	GlobalAudio.stop()
	if Global.topic1:
		btnTopic1.disabled = false
	if Global.topic2:
		btnTopic2.disabled = false
	if Global.topic3:
		btnTopic3.disabled = false
	if Global.topic4:
		btnTopic4.disabled = false
	if Global.topic5:
		btnTopic5.disabled = false

#move background
func _process(delta):
	parallax.scroll_offset += direction * speed * delta

func _on_button_pressed():
	GlobalAudio.playFX("play")
	get_tree().change_scene_to_file("res://Course/Main/Topic1/1.1.tscn")


func _on_btn_back_pressed():
	$VBoxContainer/ColorRect/HBoxContainer/btnBack/AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://UI/MainMenu.tscn")


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Course/Main/Topic2/2.1.tscn")
	GlobalAudio.playFX("play")


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://Course/Main/Topic3/3.1.tscn")
	GlobalAudio.playFX("play")


func _on_button_4_pressed():
	get_tree().change_scene_to_file("res://Course/Main/Topic4/4.1.tscn")
	GlobalAudio.playFX("play")


func _on_button_5_pressed():
	get_tree().change_scene_to_file("res://Course/Main/Topic5/5.1.tscn")
	GlobalAudio.playFX("play")
