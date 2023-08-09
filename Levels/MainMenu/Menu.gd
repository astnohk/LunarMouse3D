extends Control

@export var next_scene: PackedScene

var lines = []
var cursor_count: float = 0.0
var input_buffer = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	new_line()
	print_characters("Menu:\n")
	print_characters("    1: Connect\n")
	print_characters("    2: Scores\n")
	print_characters("> ")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cursor_count += delta
	if cursor_count > 1.0:
		cursor_count = 0.0
		if len(lines) > 0:
			var current_line: Label = lines[0]
			if len(current_line.text) > 0 and current_line.text[-1] == "_":
				current_line.text = current_line.text.substr(0, len(current_line.text) - 1)
			else:
				current_line.text += "_"

func print_characters(string: String):
	for i in range(len(string)):
		_input_character(string[i])

func input_character(character: String):
	if character == "\n":
		_execute(input_buffer)
		# Reset `input_buffer`
		input_buffer = ""
	elif character == "\b":
		input_buffer = input_buffer.substr(
			0,
			max(0, len(input_buffer) - 1))
	else:
		input_buffer += character
	_input_character(character)

func _execute(buffer: String):
	for i in range(len(buffer)):
		if buffer[i] == "1":
			start_new_level()
			break
		elif buffer[i] == "2":
			show_scores()
			break

func _input_character(character: String):
	# Eliminate Cursor
	if len(lines) > 0 and len(lines[0].text) > 0 and lines[0].text[-1] == "_":
		lines[0].text = lines[0].text.substr(0, len(lines[0].text) - 1)
	# Input the Character
	if character == "\n":
		new_line()
	elif character == "\b":
		backspace()
	else:
		var current_line: Label = lines[0]
		current_line.text += character

func new_line():
	var line: Label = Label.new()
	line.label_settings = LabelSettings.new()
	line.label_settings.line_spacing = 0
	line.label_settings.font_size = 24
	line.label_settings.font_color = Color()
	line.label_settings.font_color.r8 = 12
	line.label_settings.font_color.g8 = 239
	line.label_settings.font_color.b8 = 255
	line.label_settings.shadow_size = 0
	lines.push_front(line)
	self.get_node("Shell").add_child(line)

func backspace():
	if len(lines) > 0 and len(lines[0].text) > 0:
		lines[0].text = lines[0].text.substr(0, len(lines[0].text) - 1)

func start_new_level():
	# Start New Game
	get_tree().change_scene_to_packed(next_scene)

func show_scores():
	pass
