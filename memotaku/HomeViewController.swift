//
//  HomeViewController.swift
//  memotaku
//
//  Created by 佐々木遼平 on 2023/09/22.
//

import Foundation
import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate  {
    func didPostMain(mainData: MainCellModel) {
        editDataList.append(mainData)
    }
    weak var homeViewDelegate: HomeViewControllerDelegate?
    
    func reloadDataForTableView() {
        // テーブルビューを更新
        tableView.reloadData()
    }
    
    var editDataList: [MainCellModel] = []
    var editData = MainCellModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func presentedCalculator(_ sender: Any) {
        performSegue(withIdentifier: "toCalculator", sender: nil)
    }
    
    
    
    let realm = try! Realm() // Realmの初期化
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // カスタムセルをNibファイルから登録
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        
        // Realmからメモを読み込む
        let realm = try! Realm()
        editDataList = realm.objects(MainCellModel.self).map { $0 }
        tableView.reloadData()
    }
    
    func setSaveData() {
        let realm = try! Realm()
        let result = realm.objects(MainCellModel.self)
        editDataList = Array(result)
        
        //テーブルビュー更新
        tableView.reloadData()
    }
    
    func updateData() {
        // データを更新した後、デリゲートに通知
        homeViewDelegate?.reloadDataForTableView()
    }
    
    
}





// TwitterViewControllerのdelegateプロパティに自身を代入
//   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toCalculator" {
//            let nextView = segue.destination as! Calculator
//            nextView.delegate = self
//            nextView.editData = editCellData
//        }
//        editCellData = mainCellModel()



extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
        
        // カスタムセルの各アウトレットにデータを設定
        let memo = editDataList[indexPath.row]
        
        // DateFormatterを使用して日付を文字列に変換
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let dateString = dateFormatter.string(from: memo.date)
        
        cell.mainTitle.text = memo.title
        cell.mainDate.text = dateString // 日付の文字列を設定
        
        return cell
    }
}

extension HomeViewController: SaveNameViewDelegate {
    func didPostSave() {
        setSaveData()
    }
    
    func didSaveNewData(newData: MainCellModel) {
        
        editDataList.append(newData)
        tableView.reloadData()
    }
    
    
}

extension HomeViewController: TableViewCellDelegate {
    func segueToCalculator(with sizeData: MainCellModel) {
        // 別の画面に遷移
        performSegue(withIdentifier: "toCalculator", sender: nil)
    }
    
    func segue(with sizeData: MainCellModel) {
        editData  = sizeData
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCalculator" {
            let nextView = segue.destination as! CalculatorViewController
            nextView.delegate = self
            nextView.mainCellData = editData
        }
        editData = MainCellModel()
    }
    
    
}
