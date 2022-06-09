extends KinematicBody2D

const ACCELERATION = 2000
var MAX_SPEED = 100
var impulse_strength = 1000
const FRICTION = 2000

var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)

func _input(event):
	if event.is_action_pressed("sprint"):
		MAX_SPEED = 200
	if event.is_action_released("sprint"):
		MAX_SPEED = 100
	
	if event.is_action_pressed("shoot"):
		var type = get_parent().get_children()
		for ball in type:
			if ball.get_class() == "RigidBody2D":
				var collision = move_and_collide(Vector2.ZERO)
				if collision != null:
					var body = collision.collider
					print("collided with: ", body.name)
					var angle = self.get_angle_to(ball.position)
					ball.apply_central_impulse(Vector2(cos(angle), sin(angle)) * impulse_strength)
