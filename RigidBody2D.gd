extends RigidBody2D
@export var velocidad_min : int
@export var velocidad_max : int
var tipo_meteorito = ["grande","pequeño"]

func _ready():
	$AnimatedSprite2D.animation = tipo_meteorito[randi() % tipo_meteorito.size()]

	if $AnimatedSprite2D.animation == "grande":
		$CollisionShape2D.scale.x = 1.6
		$CollisionShape2D.scale.y = 1.6


func _on_visivility_screen_exited():
	await get_tree().create_timer(0.5).timeout
	queue_free()
