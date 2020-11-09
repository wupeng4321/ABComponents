//
//  ABBaseRoundButton.swift
//  AppBook
//
//  Created by wupeng on 2020/11/3.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit
import BPComponents

open class ABBaseRoundButton: UIButton {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.createUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func createUI() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.setTitleColor(Theme.colorWhite, for: .normal)
        self.setBackgroundImage(UIImage.imageWithColor(Theme.colorTheme), for: UIControl.State.normal)
        
        self.setTitleColor(Theme.colorWhite.withAlphaComponent(0.5), for: .highlighted)
        self.setBackgroundImage(UIImage.imageWithColor(Theme.colorTheme.withAlphaComponent(0.5)), for: .highlighted)
        
        self.setTitleColor(Theme.colorWhite.withAlphaComponent(0.5), for: .disabled)
        self.setBackgroundImage(UIImage.imageWithColor(Theme.colorDisableButton), for: UIControl.State.disabled)
    }
}

