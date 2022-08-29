//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
//    let eggTimes = ["Soft": 300, "Medium": 480, "Hard": 720]
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        var counter = 0
        let totalSeconds = eggTimes[sender.currentTitle!]!
        
        titleLabel.text = "How do you like your eggs?"
        progressBar.progress = 0.0
        
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            counter += 1
            self.progressBar.progress = Float(counter)/Float(totalSeconds)
        
            if(counter == totalSeconds){
                self.titleLabel.text = "DONE!"
                self.playSound()
                timer.invalidate()
            }
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
