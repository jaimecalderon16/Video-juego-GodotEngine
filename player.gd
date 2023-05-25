extends Area2D
@export var Velocidad : int
var Movimiento = Vector2()
var limite
signal señalGolpe

func _ready():
	hide()
	limite = get_viewport_rect().size # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Movimiento = Vector2() 
	if Input.is_action_pressed("ui_right"): #derecha
		Movimiento.x += 1
		#$Fuego.position.y = 0
	if Input.is_action_pressed("ui_left"): #izquierda 
		Movimiento.x -= 1
		#$Fuego.position.y = 0
	if Input.is_action_pressed("ui_down"):  #abajo
		Movimiento.y += 1
	
	if Input.is_action_pressed("ui_up"):  #arriba
		Movimiento.y -= 1
		#$Fuego.position.y = 0
	if Movimiento.length() > 0: #verificar si se esta moviendo
		Movimiento = Movimiento.normalized() * Velocidad #Normalizar la velocidad
	
	position += Movimiento * delta #actualizar moviminetos
	position.x = clamp(position.x,0,limite.x)
	position.y = clamp(position.y,0,limite.y)
	if Movimiento.x != 0:
		$AnimatedSprite2D.animation = "lado"
		$AnimatedSprite2D.flip_h = Movimiento.x < 0
		$AnimatedSprite2D.flip_v = false
	elif Movimiento.y != 0:
		$AnimatedSprite2D.animation = "espalda"
		$AnimatedSprite2D.flip_v = Movimiento.y > 0
	else:
		$AnimatedSprite2D.animation = "frente"
	
	
	
func inicio_player(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_body_entered(body):
	if $CollisionShape2D.disabled:
		return
	
	$CollisionShape2D.disabled = true
	emit_signal("señalGolpe")
	hide()
	
	
func _get_limite():
	return self.limite
