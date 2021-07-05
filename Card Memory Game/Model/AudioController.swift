//

import AVFoundation

class AudioController: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    
    func setLoopNumber (_ num: Int) {
        if let _ = audioPlayer {
            audioPlayer!.numberOfLoops = num
        }
    }

    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("ERROR")
            }
        }
    }
}
