extends CharacterBody3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * 0.5
		
		%Camera3D.rotation_degrees.x -= event.relative.y * 0.5
		%Camera3D.rotation_degrees.x = clamp(
			%Camera3D.rotation_degrees.x , -60 ,60
			)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _physics_process(delta):
	const SPEED = 5.5
	
	var input_direction_2D = Input.get_vector(
		"move_left","move_right","move_backward","move_forward"
	)
	
	var input_direction_3D = Vector3(
		input_direction_2D.x,0.0,input_direction_2D.y
		)
		
	var direction = input_direction_3D * transform.basis
		
	
	velocity.x = SPEED * direction.x
	velocity.z = SPEED * direction.z	
	
	move_and_slide()
