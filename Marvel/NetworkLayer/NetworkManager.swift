//
//  NetworkManager.swift
//  Marvel
//
//  Created by MAC on 24/11/2023.
//

import Foundation
import Alamofire

class NetworkManager{
    
    func fetchData<T:Codable>(url:URL,complition : @escaping (T?,Error?) -> () ){
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, interceptor: nil).responseDecodable(of: T.self) { response in
            print("In")
            switch response.result{
            case .success(let data):
             complition(data,nil)
           case .failure(let error):
             print(error.localizedDescription)
              complition(nil,error)
            }
        }
    }
}
