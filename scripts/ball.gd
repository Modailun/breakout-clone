extends RigidBody2D

var initial_velocity = Vector2(randi_range(-100,-1000), randi_range(-100,100))
var speed = 400.0
var should_reset = false
var initial_position = Vector2(0, -8.0)

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	_reset_ball()
	apply_central_impulse(initial_velocity.normalized() * speed)
	
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	state.linear_velocity = linear_velocity.normalized() * speed
	
	if should_reset:
		var next_transform = state.get_transform()
		next_transform.origin = initial_position
		state.set_transform(next_transform)
		should_reset = false

func _reset_ball():
	print('reset ball')
	speed = 400.0
	print(speed)
	should_reset = true



func _on_body_entered(body: Node) -> void:
	audio_stream_player_2d.play()
	speed*=1.05
