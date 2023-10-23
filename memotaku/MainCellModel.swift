//
//  CellModel.swift
//  memotaku
//
//  Created by 佐々木遼平 on 2023/10/07.
//

import Foundation

class CellModel {
    
    @objc dynamic var id: String = UUID().uuidString
    
    // タイトル
    @objc dynamic var title: String = ""
    
    // 日時
    @objc dynamic var time: String = "20XX/YY/ZZ"
    
    
}
