//
//  TableViiewCellDelegate.swift
//  memotaku
//
//  Created by 佐々木遼平 on 2023/10/08.
//

import Foundation
import RealmSwift

protocol TableViewCellDelegate: AnyObject {
    func segueToCalculator(with sizeData: MainCellModel)
}
