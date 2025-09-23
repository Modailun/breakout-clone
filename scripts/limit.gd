extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print("Dead Ball", body)
	# Reset ball position
	var ball = body as RigidBody2D
	ball.reset_ball()
	# Decrease life
	GameManager.lives -= 1
	print("Lives: ", GameManager.lives)
	# Check for game over
	if GameManager.lives <= 0:
		print("Game Over")
		# Reset score and lives
		GameManager.score = 0
		GameManager.lives = 3
		# Go to main menu
		GameManager.change_scene(GameManager.Scenes["MAIN_MENU"])
