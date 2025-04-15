extends Node
var a:int = 1;

@export var dialogSystem: PackedScene

# 对话系统实例
var 对话系统实例: Node = null

func _enter_tree():
	add_to_group("test")
	Log.Log();
	test();

func _ready() -> void:
	# 初始化并创建对话系统
	创建对话系统()

func 创建对话系统() -> void:
	# 实例化对话系统
	对话系统实例 = dialogSystem.instantiate()
	对话系统实例.显示对话()
	# 将对话系统添加到当前场景
	add_child(对话系统实例)
	# 连接对话系统的信号以便在对话结束时关闭
	对话系统实例.connect("对话结束", Callable(self, "_关闭对话系统"))

func _关闭对话系统() -> void:
	# 从场景树中移除对话系统
	if 对话系统实例:
		对话系统实例.queue_free()
		对话系统实例 = null

func test()->void:
	print(a);
	pass
