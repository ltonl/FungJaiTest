//
//  APIManager.swift
//  FungJaiTest
//
//  Created by tOn on 15/3/2561 BE.
//  Copyright © 2561 Tirawat Boonma. All rights reserved.
//

import UIKit
import Alamofire

class APIManager {
    static let shareInstance = APIManager()
    
    fileprivate func getDomain() -> String {
        return Constant.appMode.getUrl()
    }
    
    //Json Request
    func jsonRequest(callback: @escaping (_ response: [[String : Any]]) -> Void) {
        let urlString = self.getDomain()
        
        Alamofire.request(urlString).responseJSON { (response) in
            if response.result.isSuccess {
                if let result = response.result.value as? [NSDictionary] {
                    callback(result as! [[String : Any]])
                } else {
                    print(response.error?.localizedDescription ?? "")
                }
            }
        }
    }
}

