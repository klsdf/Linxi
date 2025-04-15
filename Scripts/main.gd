extends Node
var a:int = 1;

@export var dialogSystem: PackedScene

func _enter_tree():
	add_to_group("test")
	Log.Log();
	test();


func test()->void:
	print(a);
	pass
