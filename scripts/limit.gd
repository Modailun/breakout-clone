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
