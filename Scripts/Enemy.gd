extends Area2D

# 玩家节点的引用
var player: Node2D = null

# 射击计时器
var shoot_timer: Timer

# 敌人移动速度
var speed: float = 100.0


func _ready() -> void:
	player = get_tree().get_root().find_child("Player", true, false)
	# 初始化射击计时器
	shoot_timer = Timer.new()
	shoot_timer.wait_time = 2.0
	shoot_timer.one_shot = false
	shoot_timer.connect("timeout", Callable(self, "_on_ShootTimer_timeout"))
	add_child(shoot_timer)
	shoot_timer.start()



func _process(delta: float) -> void:
	if player:
		# 计算方向向量
		var direction = (player.global_position - global_position).normalized()
		# 更新敌人位置
		global_position += direction * speed * delta
	else:
		printerr("玩家节点未找到")



# 射击计时器超时信号处理函数
func _on_ShootTimer_timeout() -> void:
	pass
	# 执行射击逻辑
	# _shoot()

# 射击逻辑
func _shoot() -> void:
	print("敌人射击！")
	# 在这里添加射击的具体实现
