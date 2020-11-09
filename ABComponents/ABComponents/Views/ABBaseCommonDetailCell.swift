//
//  ABBaseCommonDetailCell.swift
//  AppBook
//
//  Created by wupeng on 2020/11/4.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit
import HandyJSON
import BPComponents

open class ABBaseCommonDetailCellModel: NSObject, HandyJSON {
    required public override init() {}
    public var title: String?
    public var detail: String?
}


open class ABBaseCommonDetailCell: ABBaseCommonCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        var value = 0
        value = value | CommonViewComponent.CommonImageView.rawValue
        value = value | CommonViewComponent.CommonLabel.rawValue
        value = value | CommonViewComponent.CommonSubLabel.rawValue
        self.showArrowLabel = true
        self.viewComponentValue = value
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var cellModel: ABBaseCellModel? {
        didSet {
            guard self.cellModel?.dataModel != nil else {return}
            if ((self.cellModel?.dataModel) as AnyObject).isKind(of: ABBaseCommonDetailCellModel.classForCoder()) {
                let model = self.cellModel?.dataModel as! ABBaseCommonDetailCellModel
                self.label.text = model.title
                self.subLabel.text = model.detail
                self.customizeLayout()
            }
            if (self.cellModel?.componentValue)! > 0 {
                self.viewComponentValue = self.cellModel?.componentValue
            }
        }
    }
    
    public override func createUI() {
        super.createUI()
        
        self.label.textColor = Theme.colorText
        self.label.font = Theme.font14
        
        self.subLabel.textColor = Theme.colorText
        self.subLabel.font = Theme.font14
        
    }
    
    public override func customizeLayout() {
        self.label.bp_backgroundColor()
        
        
        let width: CGFloat = (self.label.text?.singleLineWidth(with: self.label.font)) ?? 0
        
        self.label.snp.remakeConstraints { (make) in
            make.left.top.equalToSuperview().offset(bp_padding)
            make.height.equalTo(self.label.font.lineHeight)
            make.width.equalTo(width + 4)
        }
        self.subLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(self.label.snp.right).offset(0)
            make.right.bottom.equalToSuperview().offset(-bp_padding)
            make.top.equalToSuperview().offset(bp_padding)
        }
    }
}
