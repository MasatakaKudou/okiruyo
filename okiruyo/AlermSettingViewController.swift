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
    var alerms:[Alerm] = []
    var now = Date()
    
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
    /* datePickerで選択した文字を格納 */
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        self.selectDate = self.format(date: timePicker.date)
    }
    /* datePickerで選んだdateをformatしたStringにキャスト */
    func format(date:Date)->String{
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH:mm"
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
        alerm.text = self.todoTextField.text!
        /* UIDatePickerに何も触れなかった時を判別 */
        if self.format(date: timePicker.date) == self.format(date: now) {
            alerm.time = self.format(date: now)
        } else {
            alerm.time = self.selectDate
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        do {
            // CoreDataからデータをfetchしてalermsに格納
            let fetchRequest: NSFetchRequest<Alerm> = Alerm.fetchRequest()
            alerms = try context.fetch(fetchRequest)
        } catch {
            print("Error")
        }
    }
    
}
