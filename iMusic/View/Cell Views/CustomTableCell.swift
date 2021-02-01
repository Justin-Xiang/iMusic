//
//  CustomCell.swift
//  iMusic
//
//  Created by JustinXiang on 2021/01/17.
//  Copyright © 2021 JustinXiang. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .default
        self.textLabel?.textColor = .red
        self.selectedBackgroundView = UIView(frame: self.frame)
        self.selectedBackgroundView?.backgroundColor = .red
        self.textLabel?.highlightedTextColor = .white
        self.textLabel?.font = UIFont(name: "PingFang-SC-Light", size: 23)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

