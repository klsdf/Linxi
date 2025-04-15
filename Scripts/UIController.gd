extends Node

# 获取 UI 节点的引用
@onready var ui_element = $Label

# 显示 UI 元素
func show_ui(text:String):
	ui_element.text = text
	ui_element.visible = true

# 隐藏 UI 元素
func hide_ui():
	ui_element.visible = false

# 切换 UI 元素的可见性
func toggle_ui():
	ui_element.visible = not ui_element.visible


