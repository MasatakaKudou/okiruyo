//
//  HomeViewController.swift
//  okiruyo
//
//  Created by 工藤正隆 on 2020/01/23.
//  Copyright © 2020 工藤正隆. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addButton: UIImageView!
    @IBOutlet weak var alermTableView: UITableView!
    var addIcon = UIImage(named: "addButton")!
    var receiveTime: String = ""
    var receiveText: String = ""
    
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
        return 1
    }
    // セルに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        // セルに表示する値を設定する
        cell.alermTime.text = receiveTime
        cell.alermText.text = receiveText
        return cell
    }
    
}
