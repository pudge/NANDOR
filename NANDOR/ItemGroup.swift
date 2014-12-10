//
//  ItemGroup.swift
//  Horn
//
//  Created by Chris Nandor on 2014.06.02.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

import Foundation

class ItemGroup:NSObject {
    var name:String
    var items:[Item] = []

    subscript(idx:Int)->(Item) {
        return items[idx]
    }
    
    func count()->Int {
        return items.count
    }

    init(name:String, items:[Item]) {
        self.name = name
        self.items = items
    }
}
