//

import AVFoundation

class AudioController: ObservableObject {
    var uiSFXPlayer: AVAudioPlayer?
    var backgroundPlayer: AVAudioPlayer?

    func playBackgroundMusic(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                backgroundPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                backgroundPlayer?.play()
                backgroundPlayer?.numberOfLoops = -1
                backgroundPlayer?.volume = 0.05
            } catch {
                print("BACKGROUND MUSIC ERROR")
            }
        }
    }
    
    func playUISFX(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                uiSFXPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                uiSFXPlayer?.volume = 1
                uiSFXPlayer?.play()
            } catch {
                print("SFX AUDIO ERROR")
            }
        }
    }
}
