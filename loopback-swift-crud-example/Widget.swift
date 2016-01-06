//
//  Widget.swift
//  loopback-swift-crud-example
//
//  Created by Kevin Goedecke on 1/6/16.
//  Copyright © 2016 kevingoedecke. All rights reserved.
//

import Foundation

class Widget : LBPersistedModel {
    var name: String!
    var bars: NSNumber!
    var date: NSDate!
    var data: NSObject!
}