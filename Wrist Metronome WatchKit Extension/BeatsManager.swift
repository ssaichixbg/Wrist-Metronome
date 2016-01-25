//
//  BeatsManager.swift
//  Wrist Metronome
//
//  Created by YangZ. on 9/29/15.
//  Copyright © 2015 yangz. All rights reserved.
//
import WatchKit
import UIKit

let UserDefaultKeyMode = "watch_beats_mode"
let UserDefaultKeySpeed = "watch_beats_speed"
let UserDefaultKeyBeatsType = "watch_beats_type"

class BeatsManager: NSObject {
    var speed:NSInteger {
        didSet {
            NSUserDefaults.standardUserDefaults().setInteger(speed, forKey: UserDefaultKeySpeed)
            NSUserDefaults.standardUserDefaults().synchronize()
            
            if timer!.valid {
                start()
            }
        }
    }
    private var timer:NSTimer?
    
    var hapticType:NSInteger {
        didSet {
            NSUserDefaults.standardUserDefaults().setInteger(hapticType, forKey: UserDefaultKeyMode)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    var hapticTypes = [
        "Notification": WKHapticType.Notification,
        "DirectionUp": WKHapticType.DirectionUp,
        "DirectionDown": WKHapticType.DirectionDown,
        "Success": WKHapticType.Success,
        "Failure": WKHapticType.Failure,
        "Retry": WKHapticType.Retry,
        "Start": WKHapticType.Start,
        "Stop": WKHapticType.Stop,
        "Click": WKHapticType.Click,
    ]
    
    var beatsTypes = [
        
    ]
    
    var beatsType:NSInteger {
        didSet {
            NSUserDefaults.standardUserDefaults().setInteger(beatsType, forKey: UserDefaultKeyBeatsType)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    private static let sharedInstance:BeatsManager = BeatsManager()
    
    static func sharedManager() -> BeatsManager{
        return sharedInstance;
    }
    
    override init() {
        hapticType = NSUserDefaults.standardUserDefaults().integerForKey(UserDefaultKeyMode)
        speed = NSUserDefaults.standardUserDefaults().integerForKey(UserDefaultKeySpeed)
        beatsType = NSUserDefaults.standardUserDefaults().integerForKey(UserDefaultKeyBeatsType)
        
        if speed < 30 {
            speed = 30
        }
        super.init()
    }
    
    func start() {
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(60.0/Double(speed), target: self, selector: Selector("beat"), userInfo: nil, repeats: true)
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    func beat() {
        print("playHaptic...")
        WKInterfaceDevice.currentDevice().playHaptic(Array(hapticTypes.values)[hapticType])
    }
}
