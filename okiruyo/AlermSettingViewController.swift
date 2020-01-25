//
//  AlermSettingViewController.swift
//  okiruyo
//
//  Created by 工藤正隆 on 2020/01/24.
//  Copyright © 2020 工藤正隆. All rights reserved.
//

import UIKit
import CoreData

class AlermSettingViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var timePicker: UIDatePicker!
    var selectDate:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setButton.layer.cornerRadius = 10.0
        self.backButton.layer.cornerRadius = 10.0
        self.todoTextField.delegate = self
        self.timePicker.setValue(UIColor.white, forKey: "textColor")
    }
    /* 文字を打ち終わってdoneするとkeyboardを閉じる */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
       return true
    }
    /* datePickerで選択した文字を保存 */
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        self.selectDate = self.format(date: timePicker.date)
    }
    /* datePickerで選んだdateをformatしたStringにキャスト */
    func format(date:Date)->String{
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "hh:mm"
        let strDate = dateformatter.string(from: date)
        
        return strDate
    }
    /* keyboardの外に触れるとkeyboard閉じる */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.todoTextField.isFirstResponder) {
            self.todoTextField.resignFirstResponder()
        }
    }
    /* セーブ */
    @IBAction func setTimeAndText(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let alerm = Alerm(context: context)
        alerm.time = self.selectDate
        alerm.text = self.todoTextField.text!
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
}
