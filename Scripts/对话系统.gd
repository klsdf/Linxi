extends Control

class Character:
	var name: String
	var tachie: Texture2D

	func _init(nameParameter: String, tachieParameter: Texture2D = null) -> void:
		self.name = nameParameter
		self.tachie = tachieParameter


# 自定义对话类
class DialogScript:
	var content: String
	var character: Character

	# 构造函数
	func _init(ContentParameter: String, CharacterParameter: Character = null) -> void:
		self.content = ContentParameter
		self.character = CharacterParameter
	





var DialogScripts: Array = []




	# 显示当前对话
func ShowDialog() -> void:
	$CanvasLayer.visible = true;
	GameController.is_dialogue_active = true;
	if nowIndex < DialogScripts.size():
		var nowScript = DialogScripts[nowIndex]
		ShowContent(nowScript.content)
		if nowScript.character != null:
			ShowCharacterName(nowScript.character)
			ShowCharacterTachie(nowScript.character)
	else:
		textLabel.text = "对话结束。"
		characterNameLabel.text = ""
		关闭对话()
		emit_signal("对话结束")


func  ShowContent(content: String) -> void:
	textLabel.text = content

# 当前对话索引
var nowIndex: int = 0

# 文本标签节点
@export var textLabel: Label

# 角色名字标签节点
@export var characterNameLabel: Label

# 角色立绘节点
@export var characterTachieArea: TextureRect

# 对话结束信号
signal 对话结束


func ShowCharacterName(character: Character) -> void:
	if character.name != "":
		characterNameLabel.visible = true
		characterNameLabel.text = character.name
	else:
		characterNameLabel.visible = false


func ShowCharacterTachie(character: Character) -> void:
	if character.tachie != null:
		print("角色名字：", character.name)
		characterTachieArea.visible = true
	else:
		characterTachieArea.visible = false


func 关闭对话() -> void:
	# print("关闭对话")
	GameController.is_dialogue_active = false;
	$CanvasLayer.visible = false;


func _input(event: InputEvent) -> void:
	# 检查是否是鼠标点击事件
	if event is InputEventMouseButton and event.pressed:
		# 增加当前索引以显示下一句对话
		nowIndex += 1
		ShowDialog()

func _ready() -> void:
	var 映月 = Character.new("映月", load("res://Sprites/映月立绘-哭泣.png"))
	var 旁白 = Character.new("旁白", null)
	DialogScripts = [
		DialogScript.new("第一句测试", 旁白),
		DialogScript.new("角色测试", 映月),
		DialogScript.new("无名字测试"),
		DialogScript.new("然后出现名字测试", 映月)
	]


	ShowDialog()
