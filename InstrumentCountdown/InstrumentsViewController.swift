//
//  InstrumentsViewController.swift
//  InstrumentCountdown
//
//  Created by Rachel Schifano on 11/29/16.
//  Copyright © 2016 schifano. All rights reserved.
//

import Foundation
import UIKit

class InstrumentsViewController: UIViewController {
    
    // Instrument Buttons
    @IBOutlet weak var airspeedIndicatorButton: UIButton!
    @IBOutlet weak var attitudeIndicatorButton: UIButton!
    @IBOutlet weak var altimeterButton: UIButton!
    @IBOutlet weak var verticalSpeedIndicatorButton: UIButton!
    @IBOutlet weak var headingIndicatorButton: UIButton!
    @IBOutlet weak var turnCoordinatorButton: UIButton!
    
    // Countdown Time Intervals
    var airspeedCounter: TimeInterval = 25.0
    var attitudeCounter: TimeInterval = 5.0
    var altimeterCounter: TimeInterval = 15.0
    var verticalSpeedCounter: TimeInterval = 30.0
    var headingIndicatorCounter: TimeInterval = 8.0
    var turnCoordinatorCounter: TimeInterval = 12.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCircularRadiusOnButtons()

        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(InstrumentsViewController.updateCountdownLabel), userInfo: nil, repeats: true)
    }
    
    /// Changes the radius of the instrument buttons to be rounded like a circle
    func setCircularRadiusOnButtons() {
        airspeedIndicatorButton.layer.cornerRadius = airspeedIndicatorButton.frame.size.width / 2
        attitudeIndicatorButton.layer.cornerRadius = attitudeIndicatorButton.frame.size.width / 2
        altimeterButton.layer.cornerRadius = altimeterButton.frame.size.width / 2
        verticalSpeedIndicatorButton.layer.cornerRadius = verticalSpeedIndicatorButton.frame.size.width / 2
        headingIndicatorButton.layer.cornerRadius = headingIndicatorButton.frame.size.width / 2
        turnCoordinatorButton.layer.cornerRadius = turnCoordinatorButton.frame.size.width / 2
    }
    
    @IBAction func airspeedIndicatorButtonReset(_ sender: Any) {
        airspeedCounter = 15.0
    }
    
    @IBAction func attitudeIndicatorButtonReset(_ sender: Any) {
        attitudeCounter = 5.0
    }

    @IBAction func altimeterButtonReset(_ sender: Any) {
        altimeterCounter = 15.0
    }
    
    @IBAction func verticalSpeedIndicatorButtonReset(_ sender: Any) {
        verticalSpeedCounter = 30.0
    }

    @IBAction func headingIndicatorButtonReset(_ sender: Any) {
        headingIndicatorCounter = 8.0
    }
    
    @IBAction func turnCoordinatorButtonReset(_ sender: Any) {
        turnCoordinatorCounter = 12.0
    }
    
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = time - Double(minutes) * 60
        return String(format:"%02i:%02i", minutes, Int(seconds))
    }
    
    func updateCountdownLabel() {
        if airspeedCounter > 0 {
            airspeedIndicatorButton.setTitle("\(timeString(time: airspeedCounter))", for: .normal)
            airspeedCounter -= 1
        } else {
            airspeedIndicatorButton.setTitle("00:00", for: .normal)
            airspeedIndicatorButton.backgroundColor = UIColor.red
        }
        
        if attitudeCounter > 0 {
            attitudeIndicatorButton.setTitle("\(timeString(time: attitudeCounter))", for: .normal)
            attitudeCounter -= 1
        } else {
            attitudeIndicatorButton.setTitle("00:00", for: .normal)
            attitudeIndicatorButton.backgroundColor = UIColor.red
        }
        
        if altimeterCounter > 0 {
            altimeterButton.setTitle("\(timeString(time: altimeterCounter))", for: .normal)
            altimeterCounter -= 1
        } else {
            altimeterButton.setTitle("00:00", for: .normal)
            altimeterButton.backgroundColor = UIColor.red
        }
        
        if verticalSpeedCounter > 0 {
            verticalSpeedIndicatorButton.setTitle("\(timeString(time: verticalSpeedCounter))", for: .normal)
            verticalSpeedCounter -= 1
        } else {
            verticalSpeedIndicatorButton.setTitle("00:00", for: .normal)
            verticalSpeedIndicatorButton.backgroundColor = UIColor.red
        }
        
        if headingIndicatorCounter > 0 {
            headingIndicatorButton.setTitle("\(timeString(time: headingIndicatorCounter))", for: .normal)
            headingIndicatorCounter -= 1
        } else {
            headingIndicatorButton.setTitle("00:00", for: .normal)
            headingIndicatorButton.backgroundColor = UIColor.red
        }
        
        if turnCoordinatorCounter > 0 {
            turnCoordinatorButton.setTitle("\(timeString(time: turnCoordinatorCounter))", for: .normal)
            turnCoordinatorCounter -= 1
        } else {
            turnCoordinatorButton.setTitle("00:00", for: .normal)
            turnCoordinatorButton.backgroundColor = UIColor.red
        }
    }
}
