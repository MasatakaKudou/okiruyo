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
 
    
    // アプリの画面上に表示されたときに自動的に呼び出される
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.beginButton.layer.cornerRadius = 10.0
    }


}

