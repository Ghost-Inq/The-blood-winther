extends CharacterBody2D


@export var speed = 300

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("Right")
		
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("Left")
		
	if Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.play("Up")
		
	if Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.play("Down")
		
func _physics_process(_delta):
	get_input()
	move_and_slide()
