//
//  TableViewCell.swift
//  okiruyo
//
//  Created by 工藤正隆 on 2020/01/25.
//  Copyright © 2020 工藤正隆. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var alermTime: UILabel!
    @IBOutlet weak var alermText: UILabel!
    @IBOutlet weak var alermView: UIView!
    @IBOutlet weak var alermSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // switchを切り替えた時にか呼ばれる関数
    @IBAction func switchFunc(_ sender:
        UISwitch) {
        if(sender.isOn) {
            // オンの場合の処理
            print("on")
        } else {
            // オフの場合の処理
            print("off")
        }
    }
}
