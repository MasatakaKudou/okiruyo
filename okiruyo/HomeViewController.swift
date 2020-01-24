//
//  HomeViewController.swift
//  okiruyo
//
//  Created by 工藤正隆 on 2020/01/23.
//  Copyright © 2020 工藤正隆. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addButton: UIImageView!
    var addIcon = UIImage(named: "addButton")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backButton.layer.cornerRadius = 10.0
        addButton.image = addIcon
    }

}
