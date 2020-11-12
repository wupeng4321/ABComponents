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
    public var detailDes: String?
}


open class ABBaseCommonDetailCell: ABBaseCommonCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        var value = 0
        value |= CommonViewComponent.CommonImageView.rawValue
        value |= CommonViewComponent.CommonLabel.rawValue
        value |= CommonViewComponent.CommonSubLabel.rawValue
        value |= CommonViewComponent.CommonSSubLabel.rawValue
        self.showArrowLabel = true
        self.viewComponentValue = value
        self.configUI()
        self.arrowRightLabel.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(bp_padding_h)
            make.right.equalToSuperview().offset(-bp_padding_h)
            make.width.equalTo(10)
            make.height.equalTo(14)
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var cellModel: ABBaseCellModel? {
        didSet {
            guard self.cellModel?.dataModel != nil else {return}
            if (self.cellModel?.dataModel is ABBaseCommonDetailCellModel) {
                let model = self.cellModel?.dataModel as! ABBaseCommonDetailCellModel
                self.label.text = model.title
                self.subLabel.text = model.detail
                self.ssubLabel.text = model.detailDes
                self.ssubLabel.isHidden = bp_isEmptyStr(model.detailDes)
                self.customizeLayout()
            }
            if (self.cellModel?.componentValue)! > 0 {
                self.viewComponentValue = self.cellModel?.componentValue
            }
        }
    }
    
    public override func createUI() {
        super.createUI()
    }
    
    public func configUI() {
        self.label.textColor = Theme.colorText
        self.label.font = Theme.font14
        
        self.subLabel.textColor = Theme.colorText
        self.subLabel.font = Theme.font14
        self.subLabel.numberOfLines = 0
        
        self.ssubLabel.textColor = Theme.colorDetailText
        self.ssubLabel.font = Theme.font12
        self.ssubLabel.numberOfLines = 0
    }
    
    public override func customizeLayout() {
        
        let width: CGFloat = (self.label.text?.singleLineWidth(with: self.label.font)) ?? 0
        
        self.label.snp.remakeConstraints { (make) in
            make.left.top.equalToSuperview().offset(bp_padding_h)
            make.height.equalTo(self.label.font.lineHeight)
            make.width.equalTo(width + 4)
        }
        
        self.subLabel.snp.remakeConstraints { (make) in
            make.left.equalTo(self.label.snp.right).offset(0)
            make.right.equalToSuperview().offset(-bp_padding_h)
            make.top.equalToSuperview().offset(bp_padding_h)
        }
        
        self.ssubLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.label.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(bp_padding_h)
            make.right.bottom.equalToSuperview().offset(-bp_padding_h)
        }
    }
}
