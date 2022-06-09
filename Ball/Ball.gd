extends RigidBody2D

func _integrate_forces(state):
	if (abs(self.position.x) > 700 or abs(self.position.y) > 400):
		state.transform = Transform2D(0.0, Vector2(320, 180))
		self.linear_velocity = Vector2.ZERO
		
	set_bounce(0.8)
	
