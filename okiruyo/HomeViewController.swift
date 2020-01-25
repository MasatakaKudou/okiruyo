//
//  HomeViewController.swift
//  okiruyo
//
//  Created by 工藤正隆 on 2020/01/23.
//  Copyright © 2020 工藤正隆. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addButton: UIImageView!
    @IBOutlet weak var alermTableView: UITableView!
    var addIcon = UIImage(named: "addButton")!
    var alerms:[Alerm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backButton.layer.cornerRadius = 10.0
        addButton.image = addIcon
        // imageにタッチ判定を与える
        addButton.isUserInteractionEnabled = true
        // タッチ判定されたら"moveToAlerm"を実行
        addButton.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(moveToAlerm)
            )
        )
        // cellの高さを固定する
        self.alermTableView.rowHeight = 80.0;
        // read
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            // CoreDataからデータをfetchしてalermsに格納
            let fetchRequest: NSFetchRequest<Alerm> = Alerm.fetchRequest()
            alerms = try context.fetch(fetchRequest)
        } catch {
            print("Error")
        }
    }
    // 画像がタップされたら呼ばれる
    @objc func moveToAlerm() {
        let alermSettingViewController = self.storyboard?.instantiateViewController(
            withIdentifier: "AlermSettingViewController")
            as! AlermSettingViewController
        alermSettingViewController.modalPresentationStyle = .fullScreen
        self.present(
            alermSettingViewController,
            animated: true,
            completion: nil
            )
    }
    // セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerms.count
    }
    // セルに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let alerm = alerms[indexPath.row]
        cell.alermTime.text = alerm.time
        cell.alermText.text = alerm.text
        return cell
    }
}
