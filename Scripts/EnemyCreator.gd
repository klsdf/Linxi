extends Node
var shoot_timer: Timer
var player: Node2D

func _ready() -> void:
	# 初始化射击计时器
	shoot_timer = Timer.new()
	shoot_timer.wait_time = 2.0
	shoot_timer.connect("timeout", Callable(self, "CreateEnemy"))
	add_child(shoot_timer)
	shoot_timer.start()

func CreateEnemy():
	var enemy = preload("res://Scenes/Enemy.tscn").instantiate()
	add_child(enemy)
	enemy.position = Vector2(0, 0)

func _on_ShootTimer_timeout() -> void:
	CreateEnemy()
