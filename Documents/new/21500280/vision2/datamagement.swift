//
//  datamagement.swift
//  vision
//
//  Created by student38 on 2018. 6. 6..
//  Copyright © 2018년 student38. All rights reserved.
//

import Foundation

public class datamanager{
    
    //get document directory
    static fileprivate func getDocumentDirectory () -> URL{
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            return url
        }else{
            fatalError("unable to access document directory")
        }
    }
    
    
    //save anykind of codable objects
    static func save <T:Encodable>(_object:T, with fileName: String){
        let url = getDocumentDirectory().appendingPathComponent(fileName, isDirectory: false)
        let encoder = JSONEncoder()
        
        do{
            let data = try encoder.encode(_object)
            if FileManager.default.fileExists(atPath: url.path){
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
            
        }catch{
            fatalError(error.localizedDescription)
            
        }
        
    }
    
    
    
    //load anykind of codable objects
    
    static func load <T:Decodable>(_ filename: String, with type: T.Type) -> T {
        let url = getDocumentDirectory().appendingPathComponent(filename, isDirectory: false)
        if !FileManager.default.fileExists(atPath: url.path){
            fatalError("file not found at path \(url.path)")
        }
        
        
        if let data = FileManager.default.contents(atPath: url.path){
            do{
                let model = try JSONDecoder().decode(type, from: data)
                return model
            }catch{
                fatalError(error.localizedDescription)
            }
        }else{
            fatalError("data unavailable at path \(url.path)")
        }
    }
    
    //load data from a file
    static func loaddata (_ filename: String) -> Data? {
        let url = getDocumentDirectory().appendingPathComponent(filename, isDirectory: false)
        if !FileManager.default.fileExists(atPath: url.path){
            fatalError("file not found at path \(url.path)")
        }
        
        
        if let data = FileManager.default.contents(atPath: url.path){
            return data
        }else{
            fatalError("data unavailable at path \(url.path)")
        }
    }
    
    
    
    //load all files from a directory
    
    static func load_all <T:Decodable>(_ type: T.Type) -> [T]{
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: getDocumentDirectory().path)
            var model_object  = [T]()
            for filename in files {
                model_object.append(load(filename, with: type))
            }
            return model_object
            
        }catch{
            fatalError("couldnt load any files")
            
        }
    }
    
    
    //delete a file
    static func delete ( _filename: String ){
        let url = getDocumentDirectory().appendingPathComponent(_filename, isDirectory: false)
        if FileManager.default.fileExists(atPath: url.path){
            do{
                try FileManager.default.removeItem(at: url)
            }catch{
                fatalError(error.localizedDescription)
            }
        }
    }
    
    
    
    
}
