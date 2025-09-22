extends CharacterBody2D

# Vitesse de déplacement du personnage (exportée pour être modifiable dans l'éditeur)
@export var speed: float = 400.0
@export var position_y: float = 1024.0
@export var amplification_factor: float = 5.0

func _process(delta: float) -> void:
	if position.y != position_y:
		position.y = position_y	# Recentre le paddle en Y s'il a bougé

	# Récupère la direction de l'input :
	# - Renvoie -1 si "move_left" est pressé,
	# - Renvoie 1 si "move_right" est pressé,
	# - Renvoie 0 si aucune touche n'est pressée.
	var direction: float = Input.get_axis("move_left", "move_right")

	# Applique le mouvement horizontal
	if direction != 0:
	 # Si une touche est pressée, applique la vitesse dans la direction demandée
		velocity.x = direction * speed
	else:
		# Si aucune touche n'est pressée, ralentit progressivement le personnage
		# jusqu'à l'arrêt (décélération douce).
		# `move_toward` réduit `velocity.x` vers 0 à une vitesse maximale de 100 * `speed` par seconde.
		velocity.x = move_toward(velocity.x, 0.0, 100 * speed * delta)

	# Déplace le personnage en tenant compte des collisions
	# `move_and_slide()` gère automatiquement les collisions avec les murs et le sol.
	move_and_slide()

# Fonction appelée quand la balle entre en collision avec le paddle
func _on_area_2d_body_entered(body: Node2D) -> void:
	# print(body.name, " entered paddle")
	# Vérifie si le corps entrant est une balle
	if body.name == "Ball":
		var ball = body as RigidBody2D
		# Position relative de la balle par rapport au centre du paddle
		var relative_x = (ball.global_position.x - global_position.x) / ($Sprite2D.texture.get_width() / 2)
		# Normalise la position relative entre -1 (gauche) et 1 (droite)
		var normalized_x = amplification_factor*clamp(relative_x, -1.0, 1.0)
		# Calcule la nouvelle direction de la balle
		var new_direction = Vector2(normalized_x, -1).normalized()
		# Applique la nouvelle vitesse à la balle
		ball.linear_velocity = new_direction * ball.speed
