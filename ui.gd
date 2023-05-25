
extends Node
@onready var Roca = preload("res://meteorito.tscn") 
var Score
var speed = 50
var direction = Vector2.DOWN


func _ready():
	#$Control.hide()
	randomize()
	Global.load_Data()
	

func nuevo_juego():
	Score = 0
	$player.inicio_player($PositionDeInicio.position) #posicion de inicio del player 
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Listo")
	$Interfaz.update_score(Score)
	$AudioFondo.play()
	print("skin equipada" + Global.player_data.skin)

func game_over():
	$ScoreTimer.stop()
	$RocaTimer.stop()
	$Interfaz.game_over_interfas()
	$AudioGmeOver.play()
	$AudioFondo.stop()
	Global.player_data.coins = Global.player_data.coins + Score
	Global.save_Data()


func _on_inicio_timer_timeout():
	$RocaTimer.start()
	$ScoreTimer.start()


func _on_score_timer_timeout():
	Score += 1
	$Interfaz.update_score(Score)


func _on_roca_timer_timeout():
	#seleccionar un lugar aleatorio en el path o camino
	$camino/RocaPosicion.set_progress(randi())

	var R = Roca.instantiate()
	add_child(R)
	#seleccionar una direccion 
	var d = $camino/RocaPosicion.rotation + PI / 2

	R.position = $camino/RocaPosicion.position
	d += randf_range(-PI / 4, PI / 4)
	R.rotation = d 
	R.set_linear_velocity(Vector2(randf_range(R.velocidad_min, R.velocidad_max), 0).rotated(d))
	


func _on_interfaz_cerrar_shop():
	$ShopGui.hide()
