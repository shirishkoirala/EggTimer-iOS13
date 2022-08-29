//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var runCounter = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        var time =  eggTimes[sender.currentTitle!]!
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            time -= 1
            print(time)
            if(time == 0){
                timer.invalidate()
            }
        }
    }
}
