//
//  ABBaseCell.swift
//  AppBook
//
//  Created by wupeng on 2020/10/31.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import BPComponents

public enum CommonViewComponent: Int {
    case CommonLabel          = 0b1
    case CommonSubLabel       = 0b10
    case CommonSSubLabel      = 0b100
    case CommonButton         = 0b1000
    case CommonSubButton      = 0b10000
    case CommonImageView      = 0b100000
    case CommonSubImageView   = 0b1000000
    case CommonSwitch         = 0b10000000
    case CommonTextfield      = 0b100000000
    case CommonTextView       = 0b1000000000
    case CommonViewMax        = 0b10000000000
}

class ABBaseCellModel: NSObject {
    /// 同一个cell 可能会有不同的UI 类型 (CommonViewComponent.rawValue total value)
    var componentValue: Int = 0
    /// 同一个cell 可能UI相同,功能都不相同
    var funcType: Int = 0
    /// 复用标记
    var reuseIdentifier: String  = "ABBaseCell"
    /// 同一个cell 可能会有不同数据模型,子类自己实现
    var dataModel: Any?
}

class ABBaseCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    var cellModel: ABBaseCellModel?
    
    var showArrowLabel: Bool? {
        didSet {
            self.arrowRightLabel.isHidden = !self.showArrowLabel!
            if self.showArrowLabel! && !self.contentView.subviews .contains(self.arrowRightLabel) {
                self.addArrowRightLabel()
            }
        }
    }
    
    func addArrowRightLabel() {
        self.contentView.addSubview(self.arrowRightLabel)
        
        self.arrowRightLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(-bp_padding)
            make.width.equalTo(10)
            make.height.equalTo(14)
        }
    }
    
    lazy var arrowRightLabel: UILabel = {
        var label = UILabel.iconFont(from: ABIconfont.arrow_right.rawValue.toUnicode(), size: 15, textColor: Theme.colorGray)
        label.textAlignment = NSTextAlignment.right
        label.isHidden = true
        label.bp_backgroundColor()
        return label
    }()
}
