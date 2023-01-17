//
//  ViewController.swift
//  Bull'sEye
//
//  Created by mac on 16/10/2021.
//

import UIKit

class BullsEyeCV: UIViewController {
    
    //Mark:- OutLets
    
    @IBOutlet weak var targetLBLOutlet: UILabel!
    @IBOutlet weak var scoreLBLOutlet: UILabel!
    @IBOutlet weak var roundLBLOutlet: UILabel!
    @IBOutlet weak var sliderDesign: UISlider!
    
    //Mark:- Constans
    let midValue = 50
    var round = 0
    var score = 0
    var target = 0
    var deffirnce = 0
    var currentValue = 50
    var status = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSliderBarDesign()
        reset()
        
    }
    //Mark:- IBAction
    @IBAction func resetBtnPressed(_ sender: UIButton) {
       
        reset()
        
    }
    @IBAction func hitMeBtnPressed(_ sender: UIButton) {
        
        newRound()
        popAlertInfo()
    }
    @IBAction func sliderPressed(_ sender: UISlider) {
        currentValue = Int (sender.value.rounded())
    }
    
    
    //Mark:- Helper Functions
    func setSliderBarDesign(){
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        sliderDesign.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        sliderDesign.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        sliderDesign.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        sliderDesign.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    func gnerateRandomNumber(){
        target = Int.random(in: 2...99)
        targetLBLOutlet.text = "\(target)"
    }
    func reset(){
        gnerateRandomNumber()
        
        round = 0
        score = 0
        
        
        scoreLBLOutlet.text = "\(score)"
        roundLBLOutlet.text = "\(round)"
        sliderDesign.value = Float(midValue)
    }
    func newRound(){
        
        round += 1
        roundLBLOutlet.text = "\(round)"
        sliderDesign.value = Float(midValue)
        calcScore()
    }
    func calcScore(){
        deffirnce = target > currentValue ? target - currentValue : currentValue - target
        
        if deffirnce == 0{
            score += 200
            status = "perfect"
        }else if deffirnce < 3 {
            score += 100
            status = "Very Good"
        }else if deffirnce < 5{
            score += 50
            status = "Not Bad"
        }else if deffirnce < 10{
            score += 20
            status = "Good Luck next time"
        }else{
            score += 0
        }
        scoreLBLOutlet.text = "\(score)"
        
    }
    func popAlertInfo(){
        
        let alert = UIAlertController(title: status, message: " Your Target = \(target)\n Your Current Value = \(currentValue)\n  Your Differnce = \(deffirnce)" , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .cancel) { action in
            self.gnerateRandomNumber()
        }
        
        alert.addAction(action)
        
       present(alert, animated: true, completion: nil)
    }
}

