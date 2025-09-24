extends Area2D

@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	print("Dead Ball", body)
	# Reset ball position
	var ball = body as RigidBody2D
	ball.reset_ball()
	# Decrease life
	game_manager.lose_life()
	#print("Lives: ", game_manager.lives)
	# Check for game over
	if game_manager.lives <= 0:
		print("Game Over")
		# Reset score and lives
		game_manager.score = 0
		game_manager.lives = 3
		# Go to main menu
		ScenesManager.change_scene(ScenesManager.Scenes["MAIN_MENU"])
