extends Button
@onready var reverb_bus = AudioServer.get_bus_index("ReverbBus")
@onready var sfx_bus = AudioServer.get_bus_index("SFXBus")
@onready var click_audio_player: AudioStreamPlayer = $click_audio 
@onready var hover_audio_player: AudioStreamPlayer = $hover_audio  



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

#CLICK SOUND
func _on_pressed() -> void:
	if !click_audio_player.playing:
		click_audio_player.play()
		hover_audio_player.stop()

#HOVER SOUND
func _on_mouse_entered() -> void:
	if !hover_audio_player.playing and !click_audio_player.playing:
		hover_audio_player.play()

#MUTE
func _on_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,true)
	click_audio_player.stop()
	hover_audio_player.stop()
	if !toggled_on:
		AudioServer.set_bus_mute(0,false)

#HOVER CODE
func _on_check_box_mouse_entered() -> void:
	if !hover_audio_player.playing and !click_audio_player.playing:
		hover_audio_player.play()

#WET
func _on_check_box_2_toggled(toggled_on: bool) -> void:
	var effect = AudioServer.get_bus_effect(3, 0)
	effect.wet = 1
	print("reverb toggled")
	if !toggled_on:
		effect.wet = 0

#LOOP mp3
func _on_check_box_3_toggled(toggled_on: bool) -> void:
	if toggled_on:
		click_audio_player.stream.loop = true
	else:
		click_audio_player.stream.loop = false


func _on_loop_box_toggled(toggled_on: bool) -> void:
	_on_check_box_3_toggled(toggled_on)
