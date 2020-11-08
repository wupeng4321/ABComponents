//
//  ABBasecase CommonViewComponentView.swift
//  AppBook
//
//  Created by wupeng on 2020/11/3.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit


class ABBaseCommonView: UIView {
    var viewComponents: CommonViewComponent!
    
    init(frame: CGRect, viewComponents: CommonViewComponent) {
        super.init(frame: frame)
        self.viewComponents = viewComponents
        self.createUI()
    }
    
    init(viewComponents: CommonViewComponent? = .CommonLabel) {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        
    }
}
