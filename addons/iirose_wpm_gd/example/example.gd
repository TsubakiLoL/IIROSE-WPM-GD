extends Control


const LABEL = preload("res://addons/iirose_wpm_gd/example/label.tscn")
func add_mes(str:String):
	var new_label=LABEL.instantiate()
	new_label.text=str
	%mes_add_pos.add_child(new_label)


func _ready() -> void:
	IIROSEWPMGD.origin_mes.connect(origin_call_back)

	pass
func origin_call_back(args):
	add_mes(str(args))
