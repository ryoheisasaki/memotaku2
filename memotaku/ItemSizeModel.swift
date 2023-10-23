//
//  ItemSizeModel.swift
//  memotaku
//
//  Created by 佐々木遼平 on 2023/10/19.
//

import Foundation
import RealmSwift

class ItemSizeModel: Object {
    
    @objc dynamic var id: String = UUID().uuidString
    
    // 高さ
    @objc dynamic var itemHeight: String = ""
    
    // 幅
    @objc dynamic var itemWidth: String = ""
    
    // 全長
    @objc dynamic var itemFullLength: String = ""
    
    // 厚さ
    @objc dynamic var itemThickness: String = ""
    
    // 重さ
    @objc dynamic var itemWeight: String = ""
    
    // 平米
    @objc dynamic var itemSquareMeter: String = ""
    
    
    override static func primaryKey() -> String? {
        return "id"
        
    }
}
