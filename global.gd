extends Node


var player_data = {
"coins": 0,
"skin": "astronauta"
}

var skins= {
"astronauta":{
"price": 0,
"blocked": false
},
"ferxxo":{
"price": 1000,
"blocked": true
},
"westcol":{
"price": 800,
"blocked": true
},
"jh":{
"price": 500,
"blocked": true
}
}

var saveFile = "user://SAVEFILE.save"

func _ready():
	load_Data()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_Data():
	var file = FileAccess.open(saveFile,FileAccess.READ)
	if(file == null):
		save_Data()
	else:
		player_data = JSON.parse_string(file.get_var())
		skins = JSON.parse_string(file.get_var())
		file=null
		print(skins)

func save_Data():
	var file = FileAccess.open(saveFile,FileAccess.WRITE)
	file.store_var(JSON.stringify(player_data))
	file.store_var(JSON.stringify(skins))
	file=null

