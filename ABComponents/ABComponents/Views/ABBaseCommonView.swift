//
//  ABBasecase CommonViewComponentView.swift
//  AppBook
//
//  Created by wupeng on 2020/11/3.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit


open class ABBaseCommonView: UIView {
    public var viewComponents: CommonViewComponent!
    
    public init(frame: CGRect, viewComponents: CommonViewComponent) {
        super.init(frame: frame)
        self.viewComponents = viewComponents
        self.createUI()
    }
    
    public init(viewComponents: CommonViewComponent? = .CommonLabel) {
        super.init(frame: CGRect.zero)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        
    }
}
