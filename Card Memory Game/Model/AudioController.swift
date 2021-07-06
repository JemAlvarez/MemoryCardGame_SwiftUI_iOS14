//

import AVFoundation

class AudioController: ObservableObject {
    var uiSFXPlayer: AVAudioPlayer?
    var backgroundPlayer: AVAudioPlayer?
    
    func setLoopNumber (_ num: Int, player: AVAudioPlayer?) {
        if let _ = player {
            player!.numberOfLoops = num
        }
    }

    func playBackgroundMusic(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                backgroundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                backgroundPlayer?.play()
            } catch {
                print("BACKGROUND MUSIC ERROR")
            }
        }
    }
    
    func playUISFX(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                uiSFXPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                uiSFXPlayer?.play()
            } catch {
                print("SFX AUDIO ERROR")
            }
        }
    }
}
