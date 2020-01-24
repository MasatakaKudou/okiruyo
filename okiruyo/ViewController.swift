//
//  ViewController.swift
//  okiruyo
//
//  Created by 工藤正隆 on 2020/01/20.
//  Copyright © 2020 工藤正隆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var explainButton: UIButton!
    @IBOutlet weak var iconImage: UIImageView!
    var okiruyoIcon = UIImage(named: "okiruyo_icon")!
    
    // アプリの画面上に表示されたときに自動的に呼び出される
    override func viewDidLoad() {
        super.viewDidLoad()
        iconImage.image = okiruyoIcon
        self.beginButton.layer.cornerRadius = 10.0
        self.explainButton.layer.cornerRadius = 10.0
    }

}

