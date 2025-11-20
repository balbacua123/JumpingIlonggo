extends CharacterBody2D

const GRAVITY: int = 4200
const JUMP_SPEED: int = -1800
const SPEED: int = 800 

func _physics_process(delta):
	velocity.y += GRAVITY * delta 

	velocity.x = 0  
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = false  
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = true  
	elif Input.is_action_pressed("ui_down"):
			$AnimatedSprite2D.play("duck")
			$RunCol.disabled = true
	else:
		$AnimatedSprite2D.play("idle")  

	# Jumping
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			velocity.y = JUMP_SPEED
			$AnimatedSprite2D.play("jump")
			$JumpSound.play() 
	else:
		$AnimatedSprite2D.play("jump")

	move_and_slide()
