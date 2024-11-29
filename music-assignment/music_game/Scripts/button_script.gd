extends Button

@onready var click_audio_player: AudioStreamPlayer = $click_audio
@onready var hover_audio_player: AudioStreamPlayer = $hover_audio


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	if !click_audio_player.playing:
		click_audio_player.play()
		hover_audio_player.stop()

func _on_mouse_entered() -> void:
	if !hover_audio_player.playing and !click_audio_player.playing:
		hover_audio_player.play()
