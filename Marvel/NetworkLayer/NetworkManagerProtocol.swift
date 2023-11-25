//
//  NetworkManagerProtocol.swift
//  Marvel
//
//  Created by MAC on 24/11/2023.
//

import Foundation
 
protocol NetworkManagerProtocol{
    
    func fetchData<T:Codable>(url:URL,complition : @escaping (T?,Error?) -> () )
    
}
    

