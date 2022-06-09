extends Area2D

var t = Timer.new()

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
		
		# reset map
		var type = get_parent().get_children()
		# print(type)
		for node in type:
			if node.get_class() == "KinematicBody2D" or node.get_class() == "RigidBody2D":
				# print(node)
				node.get_tree().reload_current_scene()
		
		
