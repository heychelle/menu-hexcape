//
//  hecateSoundView.swift
//  menuUI
//
//  Created by Michelle Alexandra on 08/11/22.
//

import AVFoundation
import SwiftUI

var player: AVAudioPlayer!

struct hecateSoundView: View {
    var body: some View {
        VStack(spacing: 50) {
            Button(action: {
                playSound(name: "sound")
            }, label: {
                Text("PlaySound")
            })
            Button(action: {
                player.stop()
            }, label: {
                Text("StopSound")
            })
        }
    }

    func playSound(name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "mp3")

        // do nothing if url empty
        guard url != nil else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            player.numberOfLoops = -1
            player!.play()
        } catch {
            print("error")
        }
    }
}

struct hecateSoundView_Previews: PreviewProvider {
    static var previews: some View {
        hecateSoundView()
    }
}
