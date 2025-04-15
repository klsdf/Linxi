extends Control

# 自定义对话类
class 对话:
	# 对话内容
	var 内容: String
	# 角色名字
	var 角色名字: String

	# 构造函数
	func _init(内容参数: String, 角色名字参数: String) -> void:
		self.内容 = 内容参数
		self.角色名字 = 角色名字参数

# 对话内容数组
var 对话内容: Array = [
	对话.new("你好，欢迎来到我们的游戏！", "旁白"),
	对话.new("这是一个简单的对话系统示例。", "旁白"),
	对话.new("每次点击都会显示下一句对话。", "旁白"),
	对话.new("希望你喜欢这个示例！", "旁白")
]

# 当前对话索引
var 当前索引: int = 0

# 文本标签节点
@export var 文本标签: Label

# 角色名字标签节点
@export var 角色名字标签: Label

# 对话结束信号
signal 对话结束

# # Called when the node enters the scene tree for the first time.
# func _ready() -> void:
# 	# 显示初始对话
# 	显示对话()

# 显示当前对话
func 显示对话() -> void:
	if 当前索引 < 对话内容.size():
		var 当前对话 = 对话内容[当前索引]
		文本标签.text = 当前对话.内容
		角色名字标签.text = 当前对话.角色名字
	else:
		文本标签.text = "对话结束。"
		角色名字标签.text = ""
		# 发出对话结束信号
		emit_signal("对话结束")

# 处理输入事件
func _input(event: InputEvent) -> void:
	# 检查是否是鼠标点击事件
	if event is InputEventMouseButton and event.pressed:
		# 增加当前索引以显示下一句对话
		当前索引 += 1
		显示对话()
