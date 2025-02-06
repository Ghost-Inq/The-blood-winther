extends CharacterBody2D

const SPEED = 300.0


@onready var anim = $AnimatedSprite2D 


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		anim.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("Stand")
	
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false

	move_and_slide()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Wardobe.tscn")
