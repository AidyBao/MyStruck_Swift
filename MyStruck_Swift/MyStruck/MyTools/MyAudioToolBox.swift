//
//  MyAudioToolBox.swift
//  MyStruck_Swift
//
//  Created by 120v on 2018/9/30.
//  Copyright © 2018 MQ. All rights reserved.
//

import UIKit
import AudioToolbox

class MyAudioToolBox: NSObject {
    class func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    class func play(forResource resouce:String?,ofType type:String?) {
        if let file = Bundle.main.path(forResource: resouce, ofType: type) {
            var soundId: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(URL.init(fileURLWithPath: file) as CFURL, &soundId)
            self.play(withId: soundId)
        }
    }
    
    class func play(withId id: SystemSoundID) {
        AudioServicesPlaySystemSound(id)
    }
}
