//
//  BoolItem.swift
//  NANDOR
//
//  Created by Chris Nandor on 2014.11.18.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

import Foundation

class BoolItem:Item {
    var on:Bool
    
    init(name:String, label:String, on:Bool) {
        self.on = on
        super.init(name:name, label:label, cmd:"")
        
        if (self.on) {
            self.cmd = "fon";
        }
        else {
            self.cmd = "foff";
        }
        
    }
}
