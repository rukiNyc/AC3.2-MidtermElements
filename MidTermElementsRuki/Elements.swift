//
//  Elements.swift
//  MidTermElementsRuki
//
//  Created by Rukiye Karadeniz on 12/8/16.
//  Copyright © 2016 Rukiye Karadeniz. All rights reserved.
//

import Foundation

class Elements{
    
    let name: String
    let weight: Double
    let symbol: String
    let number: Int
    let melting: Int
    let boiling: Int
    
    
    init(name: String, weight: Double, symbol:String, number:Int, melting: Int, boiling: Int ){
        self.name = name
        self.weight = weight
        self.symbol = symbol
        self.number = number
        self.melting = melting
        self.boiling = boiling
        
    }
    
    static func setData(data: Data)-> [Elements]?{
        
        var house = [Elements]()
        do {
            
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            if let dictData = jsonData as? [[String:Any]]{
                
                for item in dictData{
                    if let name = item["name"] as? String,
                        let weight = item["weight"] as? Double,
                        let symbol = item["symbol"] as? String,
                        let number = item["number"] as? Int,
                        let melting = item["melting_c"] as? Int,
                        let boiling = item["boiling_c"] as? Int
                        
                    {
                        
                        let newElement = Elements(name: name, weight: weight, symbol:symbol, number: number,melting: melting, boiling: boiling )
                        house.append(newElement)
                    }
                }
            }
            
        }catch{
            
            print("Error passing data\(error)")
        }
        return house
    }
}
