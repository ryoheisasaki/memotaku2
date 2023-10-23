//
//  CalculatorViewController.swift
//  memotaku
//
//  Created by 武久 なおき on 2023/10/10.
//

import Foundation
import UIKit
import RealmSwift

class CalculatorViewController: UIViewController, SaveNameViewDelegate {
    func didPostSave() {
        
    }
    
    
    weak var delegate: SaveNameViewDelegate?
    
    var mainCellData = MainCellModel()
    
    
    private let calculator = Calculator()
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    let realm = try! Realm() //Realm初期化
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // 他の初期化処理

        
        }
    
    @IBAction func presentedSaveName(_ sender: Any) {
        performSegue(withIdentifier: "toSaveName", sender: nil)
    }
    
    @IBAction func clear(_ sender: Any) {
        calculator.clear()
        resultLabel.text = calculator.resultText
    }
    
    
    @IBAction func number0(_ sender: Any) {
        calculator.number0()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func number1(_ sender: Any) {
        calculator.number1()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func number2(_ sender: Any) {
        calculator.number2()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func number3(_ sender: Any) {
        calculator.number3()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func number4(_ sender: Any) {
        calculator.number4()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func number5(_ sender: Any) {
        calculator.number5()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func number6(_ sender: Any) {
        calculator.number6()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func number7(_ sender: Any) {
        calculator.number7()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func number8(_ sender: Any) {
        calculator.number8()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func number9(_ sender: Any) {
        calculator.number9()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func equal(_ sender: Any) {
        calculator.equal()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func add(_ sender: Any) {
        calculator.addition()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func sub(_ sender: Any) {
        calculator.subtraction()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func mult(_ sender: Any) {
        calculator.multiplication()
        resultLabel.text = calculator.resultText
    }
    
    @IBAction func div(_ sender: Any) {
        calculator.division()
        resultLabel.text = calculator.resultText
    }
    
    
    //各サイズ
    
    
    @IBOutlet weak var itemHeightField: UITextField!
    
    @IBOutlet weak var itemWidthField: UITextField!
    
    @IBOutlet weak var itemFullLengthField: UITextField!
    
    @IBOutlet weak var itemThicknessField: UITextField!
    
    @IBOutlet weak var itemWeightField: UITextField!
    
    @IBOutlet weak var itemSquareMeterField: UITextField!
    
    
    //保存する値
    func itemSave() {
        let realm = try! Realm()
        let itemSize = ItemSizeModel()
        //渡すデータ
        itemSize.itemHeight = itemHeightField.text ?? "0.0"
        itemSize.itemWidth = itemWidthField.text ?? "0.0"
        itemSize.itemFullLength = itemFullLengthField.text ?? "0.0"
        itemSize.itemThickness = itemThicknessField.text ?? "0.0"
        itemSize.itemWeight = itemWeightField.text ?? "0.0"
        itemSize.itemSquareMeter =  itemSquareMeterField.text ?? "0.0"
        
        mainCellData.itemSizeModel = itemSize
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSaveName" {
            let nextView = segue.destination as! SaveNameViewController
            nextView.saveDelegate = delegate
            nextView.mainCellData = mainCellData
            itemSave()
            
        }
    }
    
  
}
