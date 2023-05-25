extends CanvasLayer
signal iniciar_juego



func mostrar_mensaje(texto):
	$title.text = texto
	$title.show()
	$MensajeTimer.start()

func game_over_interfas():
	mostrar_mensaje("Game Over")
	await get_tree().create_timer(2).timeout
	$ButtonPlay.show()
	$ButtonShop.show()
	$ButtonCredits.show()
	$ButtonExit.show()
	$title.text = "Proyecto x"
	$title.show()

func update_score(Puntos):
	$ScoreLabel.text = str(Puntos)



func _on_mensaje_timer_timeout():
	$title.hide()

func _on_button_pressed():
	$AudioClick.play()
	$ButtonPlay.hide()
	$ButtonShop.hide()
	$ButtonCredits.hide()
	$ButtonExit.hide()
	emit_signal("iniciar_juego")


func _on_button_2_pressed():
	$AudioClickTwo.play()
	get_tree().change_scene_to_file("res://control.tscn")



func _on_button_shop_pressed():
	get_tree().change_scene_to_file("res://ShopGui.tscn")


func _on_button_exit_pressed():
	get_tree().quit()


func _on_cerrar_shop():
	pass
