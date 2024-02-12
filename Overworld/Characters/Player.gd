extends CharacterBody2D


const SPEED = 100.0
@onready var animationPlayer = $AnimationPlayer
@onready var area = $Area2D

func _physics_process(delta):
	
	velocity = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), 
	Input.get_action_strength("down")- Input.get_action_strength("up")).normalized() * SPEED

	if velocity == Vector2.ZERO:
		animationPlayer.play("idle")
	else:
		animationPlayer.play("walk")
	
	move_and_slide()

func _unhandled_input(event):
	if Input.is_action_just_pressed("interect"):
		var actionable = $Area2D.get_overlapping_areas()
		if actionable.size() > 0:
			actionable[0].action()
			return

func _on_area_2d_body_entered(body):
	if body.is_in_group("interect"):
		$"F button".visible = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("interect"):
		$"F button".visible = false
