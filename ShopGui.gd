extends Control
@onready var ContainerSkins= $ContainerSkins
var ruta = "res://sprites/"

var cont = 1
var coins



func _ready():
	setSkins(cont)
	coins = Global.player_data.coins
	$TextureCoinsRect/coins.text = str(coins)

func setSkins(cont):
	var skinsName = Global.skins.keys()
	var skinsArray = Global.skins.values()
	ContainerSkins.get_node("nameSkin").text = skinsName[cont]
	ContainerSkins.get_node("ImageSkin").texture = load(ruta + skinsName[cont] + "/Portada.png")
	ContainerSkins.get_node("ContainerPrices/PriceSkin").text = str(skinsArray[cont].price)
	
	setButtons($ButtonBuy, skinsArray[cont], skinsName[cont])

func setButtons(butom: TextureButton, skin, skinName):
	if(skinName == Global.player_data.skin):
		butom.texture_normal = load("res://GUI/Buttons/inUse.png")
		butom.texture_hover = load("")
	else:
		if(skin.blocked):
			butom.texture_normal = load("res://GUI/Buttons/BuyBoton.png")
			butom.texture_hover = load("res://GUI/pressed/buyPresed.png")
		else:
			butom.texture_normal = load("res://GUI/Buttons/equip.png")
			butom.texture_hover = load("res://GUI/pressed/equip.png")



func buySkin(skin, skinname):
	if(skin.blocked):
		if(Global.player_data.coins >= skin.price):
			Global.player_data.coins -= skin.price
			skin.blocked = false
			print("skin Comprada " + skinname)
			setSkins(cont)
	else:
		Global.player_data.skin = skinname
		print("skin equipada " + skinname)
		setSkins(cont)
	

func _on_button_atras_pressed():
	get_tree().change_scene_to_file("res://ui.tscn")
	

func _on_button_left_pressed():
	if(cont >0):
		cont -= 1
	else:
		cont = 0
	setSkins(cont)


func _on_button_rigth_pressed():
	if(cont < 3):
		cont += 1
	else:
		cont = 3
	setSkins(cont)


func _on_button_buy_pressed():
	var skinsName = Global.skins.keys()
	var skinsArray = Global.skins.values()
	buySkin(skinsArray[cont], skinsName[cont])
	Global.save_Data()
	
