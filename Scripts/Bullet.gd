extends Area2D

var speed: int = 500 # 子弹速度
var direction: Vector2 # 子弹发射方向

func _ready():
	# 连接 area_entered 信号
	connect("area_entered", _on_area_entered)
	# 启动销毁计时器
	start_destruction_timer()

func _process(delta):
	# 子弹持续移动
	position += speed * direction * delta

func _on_area_entered(area: Area2D):	
	# 检查对象是否挂载了 Enemy.gd
	if area.get_script() == preload("res://Scripts/Enemy.gd"):
		area.queue_free()
		self.queue_free()
		print("击中了敌人！")

		# 在这里添加击中敌人的逻辑
	## 处理与其他 Area2D 的碰撞
	#if area.is_in_group("enemies"):
		## 对敌人造成伤害的逻辑
		#area.take_damage()
		#queue_free()
	#elif area.is_in_group("obstacles"):
		## 子弹碰到障碍物时销毁
		#queue_free()

func start_destruction_timer():
	# 创建一个计时器
	var timer = Timer.new()
	timer.wait_time = 5.0 # 设置计时器时间为5秒
	timer.one_shot = true # 只触发一次
	add_child(timer) # 将计时器添加到子弹节点
	timer.start() # 启动计时器
	await timer.timeout # 等待计时器超时
	queue_free() # 超时后销毁子弹
