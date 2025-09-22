extends RigidBody2D

# Vitesse initiale aléatoire de la balle
@export var initial_velocity : Vector2 #randi_range(-1000, -1),randi_range(-1000, 1000)
# Vitesse constante de la balle
@export var speed: float = 400.0
# Flag pour indiquer si la balle doit être réinitialisée
@export var should_reset: bool = false
# Position initiale de la balle
@export var initial_position: Vector2 = Vector2(976, 992)
# Référence au lecteur audio pour les collisions
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Appelé quand le nœud est ajouté à la scène
func _ready() -> void:
	# Génère un angle aléatoire entre -45° et 45° par rapport à la verticale (vers le haut)
	var angle_radians = deg_to_rad(randf_range(-60, 60))
	# Crée un vecteur de direction vers le haut avec un angle aléatoire
	initial_velocity = Vector2(-sin(angle_radians), -cos(angle_radians))
	_reset_ball()
	# Applique une impulsion initiale à la balle (corrigé : normalisation avant multiplication)
	apply_central_impulse(initial_velocity.normalized() * speed)

# Appelé à chaque étape de la simulation physique
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	# Normalise la vitesse linéaire et applique la vitesse constante
	state.linear_velocity = state.linear_velocity.normalized() * speed

	# Réinitialise la balle si nécessaire
	if should_reset:
		var next_transform = state.get_transform()
		next_transform.origin = initial_position
		state.set_transform(next_transform)
		should_reset = false

# Réinitialise la balle à sa position et vitesse initiale
func _reset_ball() -> void:
	print('reset ball')
	speed = 400.0
	print(speed)
	should_reset = true
	# Réinitialise la vitesse linéaire
	linear_velocity = Vector2.ZERO
	# Réapplique l'impulsion initiale avec un nouvel angle aléatoire
	var new_angle_radians = deg_to_rad(randf_range(-60, 60))
	initial_velocity = Vector2(-sin(new_angle_radians), -cos(new_angle_radians))
	# Réapplique l'impulsion initiale
	apply_central_impulse(initial_velocity.normalized() * speed)

# Gère les collisions avec d'autres corps
func _on_area_2d_body_exited(_body: Node2D) -> void:
	# print(body.name, " exited ball")

	# Joue un son de collision
	audio_stream_player_2d.stop()
	audio_stream_player_2d.play()
	# Augmente la vitesse de 5% à chaque collision
	# speed *= 1.05
