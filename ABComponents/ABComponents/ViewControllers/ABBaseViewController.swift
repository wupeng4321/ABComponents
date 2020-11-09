//
//  ABBaseViewController.swift
//  ABComponents
//
//  Created by wupeng on 2020/10/27.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit
import BPComponents

open class ABBaseViewController: BPInitDeinitViewController {
    open override func viewDidLoad() {
        super .viewDidLoad()
        self.initNavbar()
    }
    
    public func initNavbar() {
        let leftNavBtn = UIButton.init()
        leftNavBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        leftNavBtn.titleLabel?.font = UIFont.iconfont(ofSize: 20)
        leftNavBtn.setTitle(ABIconfont.arrow_left_bold.rawValue.toUnicode(), for: UIControl.State.normal)
        leftNavBtn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -20, bottom: 0, right: 0)
        leftNavBtn.titleLabel?.textAlignment = .left
        leftNavBtn.setTitleColor(Theme.colorBlack, for: UIControl.State.normal)
        let leftNavItem = UIBarButtonItem.init(customView: leftNavBtn)
        self.navigationItem.leftBarButtonItem = leftNavItem
    }
    
    @objc public func back() {

        if bp_topViewController() != self {
            self.dismiss(animated: true, completion: nil)
            return
        }
        self.navigationController?.popViewController(animated: true)
    }
}
