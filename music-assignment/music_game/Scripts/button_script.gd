extends Button

@onready var reverb_bus = AudioServer.get_bus_index("ReverbBus")  # ReverbBus (you can replace with the actual bus name)
@onready var sfx_bus = AudioServer.get_bus_index("SFXBus")  # The other bus (SFXBus, for example)
@onready var click_audio_player: AudioStreamPlayer = $click_audio  # AudioStreamPlayer for click sound
@onready var hover_audio_player: AudioStreamPlayer = $hover_audio  # AudioStreamPlayer for hover sound
@onready var reverb_box: CheckBox = $"../Button2/reverb_box"  # Reference to the CheckBox node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Function to handle button press (click sound)
func _on_pressed() -> void:
	if !click_audio_player.playing:
		click_audio_player.play()
		hover_audio_player.stop()

# Function to handle mouse entering button (hover sound)
func _on_mouse_entered() -> void:
	if !hover_audio_player.playing and !click_audio_player.playing:
		hover_audio_player.play()

# Function to swap the bus for the audio player based on checkbox state
func _on_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,true)
	click_audio_player.stop()
	hover_audio_player.stop()
	if !toggled_on:
		AudioServer.set_bus_mute(0,false)

func _on_check_box_mouse_entered() -> void:
	if !hover_audio_player.playing and !click_audio_player.playing:
		hover_audio_player.play()

func _on_check_box_2_toggled(toggled_on: bool) -> void:
	var effect = AudioServer.get_bus_effect(3, 0)
	effect.wet = 1
	print("reverb toggled")
	if !toggled_on:
		effect.wet = 0

func _on_check_box_3_toggled(toggled_on: bool) -> void:
	pass
