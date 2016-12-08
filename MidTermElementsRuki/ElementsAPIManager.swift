//
//  ElementsAPIManager.swift
//  MidTermElementsRuki
//
//  Created by Rukiye Karadeniz on 12/8/16.
//  Copyright © 2016 Rukiye Karadeniz. All rights reserved.
//

import Foundation

class ElementsAPIManager{
    
    static let manager = ElementsAPIManager()
    init(){}
    
    
    func getData(endPoint: String, completion: @escaping((Data?) -> Void)){
        
        
        let url = URL(string: endPoint)!
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: url) { (data: Data?, _, error: Error?) in
            if error != nil{
                print("Error\(error?.localizedDescription)")
            }
            
            if let validData = data{
                completion(validData)
            }
            
            }.resume()
        
        
    }
    
}
