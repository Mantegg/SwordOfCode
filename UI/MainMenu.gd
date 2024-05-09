extends Control

@onready var parallax = $ParallaxBackground
var speed = 250
var rotationSpeed = 0.3
var direction = Vector2(-1,0)

func _ready():
	GlobalAudio.stop()

#move background
func _process(delta):
	parallax.scroll_offset += direction * speed * delta

func _on_play_pressed():
	$MarginContainer/VBoxContainer/buttons/MarginContainer/Play/AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://Overworld/Overworld.tscn")

func _on_select_pressed():
	$MarginContainer/VBoxContainer/buttons/MarginContainer2/Select/AudioStreamPlayer.play()
	get_tree().change_scene_to_file("res://UI/SelectLessons.tscn")

func _on_quit_pressed():
	$MarginContainer/VBoxContainer/buttons/MarginContainer4/Quit/AudioStreamPlayer.play()
	$Window.visible = true

func _on_window_close_requested():
	$Window/Label/AudioStreamPlayer.play()
	$Window.visible = false


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
