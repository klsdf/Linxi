extends Area2D

@export var speed:int=1;
var bullet_scene : PackedScene  = preload("res://Scenes/子弹.tscn")# 子弹场景

# # Called when the node enters the scene tree for the first time.
# func _ready() -> void:
# 	var root_node = get_tree().get_root()

# 	# 遍历根节点的所有子节点
# 	for child in root_node.get_children():
# 		print("子节点名称: ", child.name)
# 	pass # Replace with function body.


func _process(delta: float) -> void:
	if GameController.is_dialogue_active:
		return

	if Input.get_action_strength("左"):
		self.position += Vector2(-1, 0) * speed * delta
	if Input.get_action_strength("右"):
		self.position += Vector2(1, 0) * speed * delta
	if Input.get_action_strength("上"):
		self.position += Vector2(0, -1) * speed * delta
	if Input.get_action_strength("下"):
		self.position += Vector2(0, 1) * speed * delta
	# 检测鼠标左键点击
	if Input.is_action_just_pressed("攻击"):
		fire_bullet();

 
#func _physics_process(delta: float) -> void:
	#for i in get_overlapping_areas():
		#if i.name == "箱子":
			#print("检测到箱子重叠了喵！")
func fire_bullet():
	
	if bullet_scene:
		print("子弹场景设置")
		var bullet = bullet_scene.instantiate()
		bullet.global_position = self.position # 设置子弹发射位置
		bullet.direction = (get_global_mouse_position() - self.global_position).normalized()
		get_parent().add_child(bullet) # 将子弹添加到场景中
	else:
		printerr("子弹场景未设置")
		

# func _on_箱子_area_entered(area: Area2D) -> void:
# 	print("检测到箱子重叠了喵！")
# 	pass # Replace with function body.
