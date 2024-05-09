extends Sprite2D

func _process(delta):
	if Global.topic2:
		frame = 1
		$Actionable.visible = false
