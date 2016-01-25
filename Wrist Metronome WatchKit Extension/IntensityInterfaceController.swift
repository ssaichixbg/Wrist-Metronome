//
//  ModePickInterfaceController.swift
//  Wrist Metronome
//
//  Created by YangZ. on 9/29/15.
//  Copyright © 2015 yangz. All rights reserved.
//

import WatchKit
import Foundation


class IntensityInterfaceController: WKInterfaceController {
    @IBOutlet var modePicker: WKInterfacePicker!
    
    var beatsManager:BeatsManager! = BeatsManager.sharedManager()
    var pickerItems:[WKPickerItem]! = []
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        for typeStr in beatsManager.hapticTypes.keys {
            let pickerItem = WKPickerItem()
            pickerItem.title = typeStr
            pickerItems.append(pickerItem)
        }
        modePicker.setItems(pickerItems)
        modePicker.setSelectedItemIndex(beatsManager.hapticType)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func selectMode(value: Int) {
        beatsManager.hapticType = value
    }

}
