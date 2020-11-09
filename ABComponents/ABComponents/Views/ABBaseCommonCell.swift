//
//  ABBaseCommonCell.swift
//  AppBook
//
//  Created by wupeng on 2020/11/3.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa



open class ABBaseCommonCell: ABBaseCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, viewComponentValue: Int?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.viewComponentValue = viewComponentValue
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var viewComponentValue: Int? {
        didSet {
            self.createUI()
        }
    }
    
    open func createUI() {
        if self.viewComponentValue! & CommonViewComponent.CommonLabel.rawValue > 0 {
            self.label.isHidden = false
            self.contentView.addSubview(self.label)
        }
        
        if self.viewComponentValue! & CommonViewComponent.CommonSubLabel.rawValue > 0 {
            self.subLabel.isHidden = false
            self.contentView.addSubview(self.subLabel)
        }
        
        if self.viewComponentValue! & CommonViewComponent.CommonSSubLabel.rawValue > 0 {
            self.ssubLabel.isHidden = false
            self.contentView.addSubview(self.ssubLabel)
        }
        
        if self.viewComponentValue! & CommonViewComponent.CommonButton.rawValue > 0 {
            self.button.isHidden = false
            self.contentView.addSubview(self.button)
        }
        
        if self.viewComponentValue! & CommonViewComponent.CommonSubButton.rawValue > 0 {
            self.subButton.isHidden = false
            self.contentView.addSubview(self.subButton)
        }
        
        if self.viewComponentValue! & CommonViewComponent.CommonImageView.rawValue > 0 {
            self.imgView.isHidden = false
            self.contentView.addSubview(self.imgView)
        }
        
        if self.viewComponentValue! & CommonViewComponent.CommonSubImageView.rawValue > 0 {
            self.subImgView.isHidden = false
            self.contentView.addSubview(self.subImgView)
        }
        
        if self.viewComponentValue! & CommonViewComponent.CommonSwitch.rawValue > 0 {
            self.commonSwitch.isHidden = false
            self.contentView.addSubview(self.commonSwitch)
        }
        
        if self.viewComponentValue! & CommonViewComponent.CommonTextfield.rawValue > 0 {
            self.textField.isHidden = false
            self.contentView.addSubview(self.textField)
        }
        
        if self.viewComponentValue! & CommonViewComponent.CommonTextView.rawValue > 0 {
            self.textView.isHidden = false
            self.contentView.addSubview(self.textView)
        }
    }
    
    open func customizeLayout() {
        
    }
    
    lazy var label: UILabel = {
        let label = UILabel.init()
        return label
    }()
    
    lazy var subLabel: UILabel = {
        let label = UILabel.init()
        return label
    }()
    
    lazy var ssubLabel: UILabel = {
        let label = UILabel.init()
        return label
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton.init()
        return btn
    }()
    
    lazy var subButton: UIButton = {
        let btn = UIButton.init()
        return btn
    }()
    
    lazy var imgView: UIImageView = {
        let imgView = UIImageView.init()
        return imgView
    }()
    
    lazy var subImgView: UIImageView = {
        let imgView = UIImageView.init()
        return imgView
    }()
    
    lazy var commonSwitch: UISwitch = {
        let commonSwitch = UISwitch.init()
        return commonSwitch
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField.init()
        return textField
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView.init()
        return textView
    }()
    
    open override func prepareForReuse() {
        self.label.isHidden         = true
        self.subLabel.isHidden      = true
        self.ssubLabel.isHidden     = true
        self.button.isHidden        = true
        self.subButton.isHidden     = true
        self.imgView.isHidden       = true
        self.subImgView.isHidden    = true
        self.commonSwitch.isHidden  = true
        self.textField.isHidden     = true
        self.textView.isHidden      = true
    }
}
