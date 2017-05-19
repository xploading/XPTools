//
//  XXModel.swift
//  XPTools
//
//  Created by QTJT on 2017/5/18.
//  Copyright © 2017年 xpLoading. All rights reserved.
//

import UIKit

class XXModel: NSObject {

    static func modelWithJson(json:Any){
        self.setValuesForKeys(json as! [String : Any])
    }
    
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {

        
    }
    
    
}
