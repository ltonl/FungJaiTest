//
//  JsonModel.swift
//  FungJaiTest
//
//  Created by tOn on 15/3/2561 BE.
//  Copyright © 2561 Tirawat Boonma. All rights reserved.
//

import Foundation
import RealmSwift

struct JsonModel {
    var id: Int!
    var name: String!
    var type: String!
    var cover: String!
}

// Json Structure with RealmSwift
class JsonWithRealm: Object {
    @objc dynamic var name: String? = nil
    @objc dynamic var type: String? = nil
    @objc dynamic var cover: String? = nil
    var id = RealmOptional<Int>()
    
    override static func primaryKey() -> String {
        return "id"
    }
}
