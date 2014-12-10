//
//  Control.swift
//  Horn
//
//  Created by Chris Nandor on 2014.06.02.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

import Foundation

let baseURL = "http://__USER__:__PASSWORD__@__HOST__/cgi-bin/horn2.cgi";
let baseParams = "ajax=1";

class Control:NSObject {
    var session = URLSession()
    
    func fOn(name:String) {
        var params = "\(baseParams)&alias=\(name)&horn=fon"
        self.session.makeRequest(baseURL, with:params)
    }

    func fOff(name:String) {
        var params = "\(baseParams)&alias=\(name)&horn=foff"
        self.session.makeRequest(baseURL, with:params)
    }
    
    func fBright(name:String) {
        var params = "\(baseParams)&alias=\(name)&horn=fb"
        self.session.makeRequest(baseURL, with:params)
    }
    
    func stop() {
        self.session.makeRequest(baseURL, with:"horn=off&ajax=1")
    }
}

