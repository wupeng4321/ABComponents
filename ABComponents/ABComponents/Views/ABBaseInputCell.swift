//
//  ABBaseInputCell.swift
//  AppBook
//
//  Created by wupeng on 2020/10/30.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import BPComponents

class ABBaseInputCell: ABBaseCommonCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let rawValue = CommonViewComponent.CommonLabel.rawValue | CommonViewComponent.CommonTextView.rawValue
        self.viewComponentValue = rawValue
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override var cellModel: ABBaseCellModel? {
        didSet {
            if ((self.cellModel?.dataModel) as AnyObject).isKind(of: NSString.classForCoder()) {
                self.label.text = self.cellModel?.dataModel as? String
            }
            self.customizeLayout()
        }
    }

    override func createUI() {
        super.createUI()
        
        self.label.textColor = Theme.colorText
        self.label.font = Theme.font14
        
        self.textView.backgroundColor = Theme.colorBackground
    }
    
    override func customizeLayout() {
        self.label.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(bp_padding)
            make.right.equalToSuperview().offset(-bp_padding)
            make.height.equalTo(16)
        }
        
        self.textView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(bp_padding)
            make.right.bottom.equalToSuperview().offset(-bp_padding)
            make.top.equalTo(self.label.snp.bottom).offset(8)
            make.height.equalTo(60)
        }
    }
}
