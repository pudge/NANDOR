//
//  ItemGroups.swift
//  Horn
//
//  Created by Chris Nandor on 2014.06.02.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

import Foundation

var itemGroups:[ItemGroup] = []
var itemGroupsDict = [String: ItemGroup]()

class ItemGroups:NSObject {
    override init() {
        super.init()
        self.initItemGroups()
    }
    
    subscript(idx:Int)->(ItemGroup) {
        return itemGroups[idx]
    }
    
    func getItemGroup(name:String)->(ItemGroup) {
        return itemGroupsDict[name]!
    }
    
    func count()->Int {
        return itemGroups.count
    }

    func initItemGroups() {
        if (itemGroups.isEmpty) {
            itemGroups.append(ItemGroup(name: "Christmas", items:[
                BoolItem(name: "Outside Lights", label: "christmasout", on:true),
                BoolItem(name: "Outside Lights", label: "christmasout", on:false),
                BoolItem(name: "Christmas Lights", label: "christmasout", on:true),
                BoolItem(name: "Christmas Lights", label: "christmasout", on:false),
                BoolItem(name: "Christmas Tree", label: "christmastree", on:true),
                BoolItem(name: "Christmas Tree", label: "christmastree", on:false),
                ]));
            
            itemGroups.append(ItemGroup(name: "Outside", items:[
                BoolItem(name: "Front Lights", label: "frontlight", on:true),
                BoolItem(name: "Front Lights", label: "frontlight", on:false),
                BoolItem(name: "Christmas Lights", label: "christmasout", on:true),
                BoolItem(name: "Christmas Lights", label: "christmasout", on:false),
                ]));
            
            itemGroups.append(ItemGroup(name: "Music Room", items:[
                BoolItem(name: "Lights", label: "musiclight", on:true),
                BoolItem(name: "Lights", label: "musiclight", on:false),
                BoolItem(name: "Recording", label: "recordinglight", on:true),
                BoolItem(name: "Recording", label: "recordinglight", on:false),
                ]));
            
            itemGroups.append(ItemGroup(name: "Goal Horn", items:[
                BoolItem(name: "Lamp", label: "hornlamp", on:true),
                BoolItem(name: "Lamp", label: "hornlamp", on:false),
                Item(name: "Lamp", label: "hornlamp", cmd:"fb"),
                Item(name: "All", label: "", cmd:"off"),
                ]));
            
//            itemGroups.append(ItemGroup(name: "Bedroom", items:[
//                BoolItem(name: "Light", label: "bedroomlight", on:true),
//                BoolItem(name: "Light", label: "bedroomlight", on:false),
//                Item(name: "Light", label: "bedroomlight", cmd:"fb"),
//                ]));

//            itemGroups.append(ItemGroup(name: "Family Room", items:[
//                BoolItem(name: "Light", label: "playlight", on:true),
//                BoolItem(name: "Light", label: "playlight", on:false),
//                Item(name: "Light", label: "playlight", cmd:"fb"),
//                BoolItem(name: "Closet Light", label: "closetlight", on:true),
//                BoolItem(name: "Closet Light", label: "closetlight", on:false),
//                BoolItem(name: "Hall Light", label: "halllight", on:true),
//                BoolItem(name: "Hall Light", label: "halllight", on:false),
//                ]));

            itemGroups.append(ItemGroup(name: "Test", items:[
                BoolItem(name: "A", label: "testa", on:true),
                BoolItem(name: "A", label: "testa", on:false),
                BoolItem(name: "C", label: "testc", on:true),
                BoolItem(name: "C", label: "testc", on:false),
                BoolItem(name: "H", label: "testh", on:true),
                BoolItem(name: "H", label: "testh", on:false),
                ]));
            
            for itemGroup in itemGroups {
                itemGroupsDict[itemGroup.name] = itemGroup
            }
        
        }
    }
}
