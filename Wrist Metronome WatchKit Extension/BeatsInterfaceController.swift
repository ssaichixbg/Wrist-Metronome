//
//  BeatsInterfaceController.swift
//  Wrist Metronome
//
//  Created by YangZ. on 9/30/15.
//  Copyright © 2015 yangz. All rights reserved.
//

import WatchKit
import Foundation


class BeatsInterfaceController: WKInterfaceController {
    @IBOutlet var beatsPicker: WKInterfacePicker!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func selectBeats(value: Int) {
    }
}
