extends AnimatableBody2D

func _on_area_2d_body_exited(_body: Node2D) -> void:
    #print(body.name, " exited block")
    GameManager.score += 10
    print("Score: ", GameManager.score)
    queue_free()