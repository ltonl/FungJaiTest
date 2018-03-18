//
//  Constant.swift
//  FungJaiTest
//
//  Created by tOn on 15/3/2561 BE.
//  Copyright © 2561 Tirawat Boonma. All rights reserved.
//

import UIKit

class Constant {
    static let appMode: WorkingMode = .DEV
}

enum WorkingMode: String {
    case DEV
    
    func getUrl() -> String {
        switch self {
        case .DEV:
            return "https://www.anop72.info/api/seed.json"
        }
    }
}

