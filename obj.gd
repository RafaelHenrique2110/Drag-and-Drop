extends Area2D
var press: bool
var _mouse_over: bool
var  collizion: bool
var  collizionObj
var startPosition: Vector2
@export var id: int;
func _ready():
	startPosition= position
pass
func _process(delta: float) -> void:

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and _mouse_over:
		if press: _Move();
	if collizion:
		
		if collizionObj.is_in_group("Drop") and press == false :
			if collizionObj. _getIDDrop() == id  : position= collizionObj.position
			else: position = startPosition
		
	else:
		if  press == false: position = startPosition
pass
func _Move() -> void:
	position= get_global_mouse_position();
pass
func _on_body_entered(body) -> void:
	
	collizionObj=body
	collizion=true
pass
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and _mouse_over :
				print("Objeto clicado!")
				press= true
			elif not event.pressed:
				press= false
				print("Objeto nao clicado!")
pass
func _on_mouse_entered() -> void:
	_mouse_over= true;
	print("mouse")
pass 
func _on_body_exited(body: Node2D) -> void:
	collizion= false
	collizionObj= null
pass 
func _on_mouse_exited() -> void:
	if press == false:_mouse_over= false;
	pass # Replace with function body.
