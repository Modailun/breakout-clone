extends AnimatableBody2D

@onready var game_manager: Node = %GameManager

func _on_area_2d_body_exited(body: Node2D) -> void:
    #print(body.name, " exited block")
    game_manager.add_point(10)
    var ball = body as RigidBody2D
    ball.accelerate_ball(1.01)

    #print("Score: ", game_manager.score)
    queue_free()