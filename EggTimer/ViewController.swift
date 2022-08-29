//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    
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
                timer.invalidate()
            }
        }
    }
}
