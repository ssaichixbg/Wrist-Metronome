//
//  InterfaceController.swift
//  Wrist Metronome WatchKit Extension
//
//  Created by YangZ. on 9/29/15.
//  Copyright © 2015 yangz. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    @IBOutlet var progressGroup: WKInterfaceGroup!
    @IBOutlet var picker: WKInterfacePicker!
    var beatsManager:BeatsManager! = BeatsManager.sharedManager()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // create animated images and picker items
        var images: [UIImage]! = []
        var pickerItems: [WKPickerItem]! = []
        for (var i = 0; i <= 36; i++) {
            let name = "progress-\(i)"
            images.append(UIImage(named: name)!)
        }
        for (var i = 30; i <= 150; i++) {
            let pickerItem = WKPickerItem()
            pickerItem.title = "\(i)"
            pickerItem
            pickerItems.append(pickerItem)
        }
        let progressImages = UIImage.animatedImageWithImages(images, duration: 0.0)
        progressGroup.setBackgroundImage(progressImages)
        picker.setCoordinatedAnimations([progressGroup])
        picker.setItems(pickerItems)
        picker.setSelectedItemIndex(beatsManager.speed-30)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        picker.focus()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func selectSpeed(value: Int) {
        beatsManager.speed = value + 30
    }
}
