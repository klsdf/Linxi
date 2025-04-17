extends Control

@export var label: Label


func _ready() -> void:
	# 确保在开始时设置默认语言
	TranslationServer.set_locale("en")





func _on_english_button_down() -> void:
	# 设置语言为英文
	TranslationServer.set_locale("en")
	# 获取翻译后的文本
	var greeting = tr("你好")
	# 更新标签文本
	label.text = greeting
	# 打印翻译后的文本
	print(greeting)


func _on_chinese_button_down() -> void:
	# 设置语言为中文
	TranslationServer.set_locale("zh")
	# 获取翻译后的文本
	var greeting = tr("你好")
	# 更新标签文本
	label.text = greeting
	# 打印翻译后的文本
	print(greeting)
	