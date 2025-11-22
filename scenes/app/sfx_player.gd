extends AudioStreamPlayer

const debug = true
@export var path = "res://assets/sfx/"
var sfx_playlist = []

func _ready():
	if debug: print("Creating sfx_playlist")
	self.populate_sfxlist()#populate bgm from folder

func populate_sfxlist():
	var dir = DirAccess.open(self.path)
	if dir:
		if debug: print("Finding content in ", self.path)
		dir.list_dir_begin()
		var fn = dir.get_next()
		while fn != "":
			if (!dir.current_is_dir()) && (!fn.ends_with("import")):
				self.sfx_playlist.append(fn)
				#print("adding sfx ", fn)
			fn = dir.get_next()
	else: print("No contents in ", self.path)
	if debug: print("SFX list: ", self.sfx_playlist)

func play_effect(sfx_name:String):
	if !self.sfx_playlist:
		return
	if sfx_name not in self.sfx_playlist:
		if debug: print("ERROR sfx file not found:", path + sfx_name)
		return
	var sfx_stream = null
	var asp = AudioStreamPlayer.new()
	sfx_stream = load(path + sfx_name)
	asp.stream = sfx_stream
	asp.name = "SFX"
	add_child(asp)
	asp.play()	
	await asp.finished
	asp.queue_free()

func list():
	return self.sfx_playlist
