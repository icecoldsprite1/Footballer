extends KinematicBody2D

onready var ball = get_parent().get_node("Ball")
const ACCELERATION = 2000
var MAX_SPEED = 5000
var impulse_strength = 1000
const FRICTION = 2000
var t = Timer.new()

var velocity = Vector2.ZERO

func _ready():
	t.set_wait_time(0.5)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
func _physics_process(delta):
	velocity = velocity.normalized()
	if ball.position.x > position.x:
		velocity.x = MAX_SPEED * delta 
	if ball.position.x < position.x:
		velocity.x = -MAX_SPEED * delta
	if ball.position.y > position.y:
		velocity.y = MAX_SPEED * delta
	if ball.position.y < position.y:
		velocity.y = -MAX_SPEED * delta
	velocity = move_and_slide(velocity)
