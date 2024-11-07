@tool
extends EditorPlugin
#插件构建面板
var script_construct_panel
const WPM_SCRIPT_CONSTRUCT = preload("res://addons/iirose_wpm_gd/script_construct/wpm_script_construct.tscn")
func _enter_tree() -> void:
	if script_construct_panel!=null:
		script_construct_panel.queue_free()
	script_construct_panel=WPM_SCRIPT_CONSTRUCT.instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_BL,script_construct_panel)
	
	add_autoload_singleton("IIROSEWPMGD","res://addons/iirose_wpm_gd/autoload/iirose_wpm_gd.tscn")
	# Initialization of the plugin goes here.
	pass


func _exit_tree() -> void:
	if script_construct_panel!=null:
		remove_control_from_docks(script_construct_panel)
		script_construct_panel.queue_free()
		
	remove_autoload_singleton("IIROSEWPMGD")
	# Clean-up of the plugin goes here.
	pass
