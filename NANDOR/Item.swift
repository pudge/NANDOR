//
//  Item.swift
//  Horn
//
//  Created by Chris Nandor on 2014.06.02.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

import Foundation

class Item:NSObject {
    var name:String
    var label:String
    var cmd:String

    init(name:String, label:String, cmd:String) {
        self.name = name
        self.label = label
        self.cmd = cmd
    }
}
