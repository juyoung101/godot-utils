extends AudioStreamPlayer

const debug = false
@export var path = "res://assets/bgm/"
var app_playlist = []
var curr_track = 0

func _ready():
	print("Creating app_playlist")
	self.populate_tracklist()#populate bgm from folder
	self.app_playlist.shuffle()#shuffle list
	print("Shuffled app_playlist: ", app_playlist)
	self.play_next()#start app_playlist
	pass

func populate_tracklist():
	var dir = DirAccess.open(self.path)
	if dir:
		print("Finding content in ", self.path)
		dir.list_dir_begin()
		var fn = dir.get_next()
		while fn != "":
			if (!dir.current_is_dir()) && (!fn.ends_with("import")):
				self.app_playlist.append(fn)
				if debug: print("adding track", fn)
			fn = dir.get_next()
	else: print("No contents in ", self.path)
	if print_debug: print("BGM app_playlist: ", self.app_playlist)

func play_next():
	if !self.app_playlist:
		return
	if self.curr_track == self.app_playlist.size():
		self.curr_track = 0
	else: self.curr_track += 1
	print("now playing: ", self.app_playlist[self.curr_track])
	self.stream = AudioStream.new()
	self.stream = load(path + self.app_playlist[self.curr_track])
	self.play()
	
func play_single(bgm:String):
	self.stop()
	print("now playing: ", bgm)
	self.stream = AudioStream.new()
	self.stream = load(path + bgm)
	self.play()

func list():
	return self.app_playlist
	
