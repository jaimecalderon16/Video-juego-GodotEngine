extends Node
var nodo_visible = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if nodo_visible:
		var nodo_visible = true
		# El nodo debe estar visible
	else:
		# El nodo debe estar oculto
		set_process(false)
