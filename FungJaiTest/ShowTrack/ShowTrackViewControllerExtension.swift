//
//  ShowTrackViewControllerExtension.swift
//  FungJaiTest
//
//  Created by tOn on 16/3/2561 BE.
//  Copyright © 2561 Tirawat Boonma. All rights reserved.
//

import Foundation

extension ShowTrackViewController {
    
    //Json Response
    func callbackJsonData(_ response: [[String : Any]]) {
        
        HUD.hide(animated: true)

        for result in response {
            var jsonModel = JsonModel()
            
            let id = result["id"] as? Int ?? 0
            let name = result["name"] as? String ?? ""
            let type = result["type"] as? String ?? ""
            let cover = result["cover"] as? String ?? ""
            
            jsonModel.id = id
            jsonModel.name = name
            jsonModel.type = type
            jsonModel.cover = cover
            
            self.insertOrUpdate(updateObject: jsonModel)
        }
        
        collectionView.reloadData()
    }
    
    //Add Objects to Realm
    fileprivate func insertOrUpdate(updateObject: JsonModel) {
        try! realm.write({
            
            let jsondata = JsonWithRealm()
            jsondata.id.value = updateObject.id
            jsondata.name = updateObject.name
            jsondata.type = updateObject.type
            jsondata.cover = updateObject.cover
            
            realm.add(jsondata, update: true)
        })
    }
}
