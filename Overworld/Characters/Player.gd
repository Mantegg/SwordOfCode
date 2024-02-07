extends CharacterBody2D


const SPEED = 100.0
@onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	
	velocity = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), 
	Input.get_action_strength("down")- Input.get_action_strength("up")).normalized() * SPEED

	if velocity == Vector2.ZERO:
		animationPlayer.play("idle")
	else:
		animationPlayer.play("walk")
	
	move_and_slide()
