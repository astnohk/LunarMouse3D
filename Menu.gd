extends Control

@export var next_scene: PackedScene

var lines = []
var cursor_count: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	new_line()
	input_characters("Menu:\n")
	input_characters("    1: Connect\n")
	input_characters("    2: Scores\n")
	input_characters("> ")

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

func input_characters(string: String):
	for i in range(len(string)):
		_input_character(string[i])

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
	line.label_settings.font_size = 16
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

func _on_label_new_game_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			# Start New Game
			get_tree().change_scene_to_packed(next_scene)

func _on_label_scores_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			# Show Scores
			pass
