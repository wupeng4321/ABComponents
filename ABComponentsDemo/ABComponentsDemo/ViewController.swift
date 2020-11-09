//
//  ViewController.swift
//  ABComponentsDemo
//
//  Created by wupeng on 2020/11/7.
//

import UIKit
import HandyJSON
import BPComponents
import ABComponents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let a = UILabel.init(frame:CGRect.init(x: 100, y: 100, width: 100, height: 100));
        a.font = UIFont.iconfont(ofSize: 11)
        a.text = "e66a".toUnicode()
        self.view.addSubview(a)
        a.bp_backgroundColor()
    }
}

