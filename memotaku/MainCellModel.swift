//
//  CellModel.swift
//  memotaku
//
//  Created by 佐々木遼平 on 2023/10/07.
//

import Foundation
import RealmSwift

class MainCellModel: Object {
    
    @objc dynamic var id: String = UUID().uuidString
    
    // タイトル
    @objc dynamic var title: String = ""
    
    // 日時
    @objc dynamic var date: Date = Date()
    
    //各サイズ
    @objc dynamic var itemSizeModel: ItemSizeModel? 
    
    override static func primaryKey() -> String? {
        return "id"
        
    }
}
