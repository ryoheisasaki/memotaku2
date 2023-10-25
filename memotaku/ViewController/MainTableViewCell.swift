//
//  MainTableViewCell.swift
//  memotaku
//
//  Created by 佐々木遼平 on 2023/09/28.
//

import UIKit
import Foundation

class MainTableViewCell: UITableViewCell {
    //delegateのプロパティ
    var delegate: TableViewCellDelegate?
    override func awakeFromNib() {
            super.awakeFromNib()
        }
    
    
    func segueToCalculator() {
        delegate?.segueToCalculator(with: sizeData)
    }
    
    var sizeData = MainCellModel()
    
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var mainDate: UILabel!
    @IBOutlet weak var mainEditButton: UIButton!
    
    
    @IBAction func mainEditButton(_ sender: Any) {
        // 別の画面に遷移
        delegate?.segueToCalculator(with: sizeData)
    }
    
    
    
   override func setSelected(_ selected: Bool, animated: Bool) {
                super.setSelected(selected, animated: animated)
            }

    
    
    func setCell(mainCell: MainCellModel) {
        sizeData = mainCell
        self.mainTitle.text = sizeData.title
        
        // Date を String に変換
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss" // 任意の日付フォーマットに変更
        let dateString = dateFormatter.string(from: sizeData.date)
        self.mainDate.text = dateString
        
        
    }
    func segueToCalculatorWithSizeData() {
        delegate?.segueToCalculator(with: sizeData)
    }
}
