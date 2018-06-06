//
//  goal.swift
//  vision
//
//  Created by student38 on 2018. 6. 6..
//  Copyright © 2018년 student38. All rights reserved.
//

import Foundation

import Foundation



struct goal : Codable{
    var gimage:String
    var gtitle:String
    var gdate:Date
    var item_identifier:UUID
    
    func save_item(){
        datamanager.save(_object: self, with: item_identifier.uuidString)
    }
    
    func delete_item(){
        datamanager.delete(_filename: item_identifier.uuidString)
    }
    
    mutating func completed(){
        self.completed()
        datamanager.save(_object: self, with: item_identifier.uuidString)
    }
    
}

