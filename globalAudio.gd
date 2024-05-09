extends AudioStreamPlayer

func playFX(name):
	var stream
	
	match name:
		"no":
			stream = preload("res://Assets/soundEffect/wrong.mp3")
		"yes":
			stream = preload("res://Assets/soundEffect/correct.mp3")
		"click":
			stream = preload("res://Assets/soundEffect/click.mp3")
		"play":
			stream = preload("res://Assets/soundEffect/Play.mp3")
	
	var fxPlayer = AudioStreamPlayer.new()
	fxPlayer.stream = stream
	fxPlayer.name = "fx_Player"
	fxPlayer.volume_db = -10
	add_child(fxPlayer)
	fxPlayer.play()
	
	await fxPlayer.finished
	
	fxPlayer.queue_free()
