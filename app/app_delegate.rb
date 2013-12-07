class AppDelegate

  attr_accessor :audioPlayer

  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow
  end

  def buildWindow
    startListener
    setupNoooooo
  end

  def commands
    @commands = ["no", "ok photoshop"]
  end

  def startListener
    @listener = NSSpeechRecognizer.alloc.init
    @listener.setCommands commands
    @listener.setDelegate self
    @listener.setListensInForegroundOnly true
    @listener.startListening
    @listener.setBlocksOtherRecognizers true
  end

  def speechRecognizer(sender, didRecognizeCommand: cmd)
    puts cmd
    if cmd == "no" || cmd == "ok photoshop"
      noooooo
    end
  end

  def setupNoooooo
    path = NSBundle.mainBundle.pathForResource("nooo", ofType: "mp3")
    file = NSURL.fileURLWithPath(path)
    @audioPlayer = AVAudioPlayer.alloc.initWithContentsOfURL(file, error: nil)
    @audioPlayer.prepareToPlay
  end

  def noooooo
    @audioPlayer.play
  end

end
