extends Area2D

var t = Timer.new()
signal goal_scored

func _on_Net_body_entered(body):
	if body.get_class() == "RigidBody2D":
		# when ball enters net
		t.set_wait_time(0.25)
		t.set_one_shot(true)
		body.add_child(t)
		t.start()
		yield(t, "timeout")
		body.sleeping = true
		
		# time between goal and ball reset
		t.set_wait_time(2)
		t.set_one_shot(true)
		body.add_child(t)
		t.start()
		yield(t, "timeout")
		
		# goal
		emit_signal("goal_scored")
		
		# reset map
		var type = get_parent().get_children()
		for node in type:
			if node.get_class() == "RigidBody2D":
				node.position = Vector2(320, 180)
			if node.get_class() == "KinematicBody2D":
				if node.name == "Player":
					node.position = Vector2(230, 175)
				elif node.name == "Enemy":
					node.position = Vector2(402, 175)
				elif node.name == "Enemy2":
					node.position = Vector2(452, 175)
				elif node.name == "Enemy3":
					node.position = Vector2(552, 175)

