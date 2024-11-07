extends Node
#三种信息信号
signal room_message(mes:Dictionary)
signal private_message(mes:Dictionary)
signal bullet_message(mes:Dictionary)

signal origin_mes(mes)
#接口
var interface:JavaScriptObject
var js_code:String="""
function IIROSE_WPM_GD_start() {
	var interface = {
		postMessageCallBack:null,
		setPostMessageCallBack: (loaded) => interface.postMessageCallBack = loaded,
	}
	window.addEventListener('message', (event)=>{
		if (typeof interface.postMessageCallBack !== 'undefined') {
   			interface.postMessageCallBack(event.data)
		}

	});
	return interface;
}
var IIROSE_WPM_GD_interface = IIROSE_WPM_GD_start();
alert("蔷薇WPMGD代码部分加载完毕");
"""



func _ready() -> void:
	if _is_not_web():
		return
	JavaScriptBridge.eval(js_code,true)
	interface=JavaScriptBridge.get_interface("IIROSE_WPM_GD_interface")
	interface.setPostMessageCallBack(mes_get_call_back)

@onready var mes_get_call_back=JavaScriptBridge.create_callback(mes_input)

func mes_input(args):
	origin_mes.emit(args)
	
	pass

func _is_not_web() -> bool:
	return OS.get_name() != "Web"
