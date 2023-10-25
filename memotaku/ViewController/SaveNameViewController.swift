//
//  SaveNameViewController.swift
//  memotaku
//
//  Created by 武久 なおき on 2023/10/10.
//

import Foundation
import UIKit
import RealmSwift

class SaveNameViewController: UIViewController {
    
    weak var saveDelegate: SaveNameViewDelegate?
    var mainCellData = MainCellModel()
    var itemSizeData = ItemSizeModel()
    
    @IBOutlet weak var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var titleView: UITextField!
    
    
    // 閉じるボタンがタップされた時
    @IBAction func onTapCancel(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    //保存ボタン dismis使う
    @IBAction func onTapSave(_ sender: Any) {
        //値を保存
        save()
        
        // デリゲートメソッドを呼び出して通知を送る
        saveDelegate?.didPostSave()
        
        //presentingViewController２回で２画面戻り、dismissで画面を閉じる
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // ポップアップの外側をタップした時にポップアップを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var tapLocation: CGPoint = CGPoint()
        // タッチイベントを取得する
        let touch = touches.first
        // タップした座標を取得する
        tapLocation = touch!.location(in: self.view)
        
        let popUpView: UIView = popUpView
        
        if !popUpView.frame.contains(tapLocation) {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func save() {
        let realm = try! Realm()

        // Realm データベースに保存
        do {
            try realm.write {
                mainCellData.title = titleView.text ?? "無題"
                mainCellData.date = Date()
                mainCellData.itemSizeModel = itemSizeData
                realm.add(mainCellData)
            }
        } catch {
            // エラーハンドリング
            print("Failed to write to Realm: \(error)")
            
        }
    }
}

