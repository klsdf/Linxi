extends Node

# 保存文件的路径
var save_file_path_binary: String = "user://savefile.dat"
var save_file_path_json: String = "user://savefile.json"

# 示例游戏数据
var game_data: Dictionary = {
    "player_name": "玩家1",
    "score": 1000,
    "level": 1,
    "inventory": ["item1", "item2", "item3"],
}

# 保存游戏数据为二进制格式
func save_game_binary(data: Dictionary) -> void:
    var file = FileAccess.open(save_file_path_binary, FileAccess.WRITE)
    if file:
        file.store_var(data.duplicate())
        file.close()
        print("游戏数据已保存为二进制格式。")
    else:
        push_error("无法打开文件进行写入：%s" % save_file_path_binary)

# 加载二进制格式的游戏数据
func load_game_binary() -> Dictionary:
    if FileAccess.file_exists(save_file_path_binary):
        var file = FileAccess.open(save_file_path_binary, FileAccess.READ)
        if file:
            var data = file.get_var()
            file.close()
            print("已加载二进制格式的游戏数据。")
            return data
        else:
            push_error("无法打开文件进行读取：%s" % save_file_path_binary)
            return {}
    else:
        print("二进制保存文件不存在。")
        return {}

# 保存游戏数据为 JSON 格式
func save_game_json(data: Dictionary) -> void:
    var file = FileAccess.open(save_file_path_json, FileAccess.WRITE)
    if file:
        var json_string = JSON.stringify(data)
        file.store_string(json_string)
        file.close()
        print("游戏数据已保存为 JSON 格式。")
    else:
        push_error("无法打开文件进行写入：%s" % save_file_path_json)

# 加载 JSON 格式的游戏数据
func load_game_json() -> Dictionary:
    if FileAccess.file_exists(save_file_path_json):
        var file = FileAccess.open(save_file_path_json, FileAccess.READ)
        if file:
            var content = file.get_as_text()
            file.close()
            var json = JSON.new()
            var error = json.parse(content)
            if error == OK:
                print("已加载 JSON 格式的游戏数据。")
                return json.data
            else:
                push_error("JSON 解析错误：%s" % json.get_error_message())
                return {}
        else:
            push_error("无法打开文件进行读取：%s" % save_file_path_json)
            return {}
    else:
        print("JSON 保存文件不存在。")
        return {}

# 打开保存文件的文件夹
func open_save_folder() -> void:
    var folder_path = OS.get_user_data_dir()
    match OS.get_name():
        "Windows":
            OS.execute("explorer", [folder_path])
        "OSX":
            OS.execute("open", [folder_path])
        "X11":
            OS.execute("xdg-open", [folder_path])
        _:
            print("不支持的操作系统。")

# 打印游戏数据
func log_game_data(data: Dictionary) -> void:
    for key in data.keys():
        print("%s: %s" % [key, str(data[key])])

# 示例：保存和加载游戏数据
func _ready():
    # 保存游戏数据为二进制格式
    save_game_binary(game_data)
    # 加载并打印二进制格式的游戏数据
    var loaded_data_binary = load_game_binary()
    log_game_data(loaded_data_binary)

    # 保存游戏数据为 JSON 格式
    save_game_json(game_data)
    # 加载并打印 JSON 格式的游戏数据
    var loaded_data_json = load_game_json()
    log_game_data(loaded_data_json)

    # 打开保存文件的文件夹
    open_save_folder()
