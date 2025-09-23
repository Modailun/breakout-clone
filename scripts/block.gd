extends AnimatableBody2D

func _on_area_2d_body_exited(body: Node2D) -> void:
    #print(body.name, " exited block")
    GameManager.score += 10
    var ball = body as RigidBody2D
    ball.accelerate_ball(1.01)

    print("Score: ", GameManager.score)
    queue_free()