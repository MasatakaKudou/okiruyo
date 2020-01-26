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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
