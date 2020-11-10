//
//  ABBaseSingleSelectViewController.swift
//  ABComponents
//
//  Created by wupeng on 2020/11/5.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import BPComponents
import Dispatch

open class ABBaseSingleSelectViewController: ABBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    open override func viewDidLoad() {
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(bp_screenHeight / 2)
        }
        self.backButton.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(self.tableView.snp.top)
        }
    }
    
    public var titles:[String] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK UITableViewDelegate & UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.bp_classString)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: UITableViewCell.bp_classString)
            cell?.textLabel?.textAlignment = .left
            cell?.textLabel?.font = Theme.font14
            cell?.textLabel?.textColor = Theme.colorText
            
        }
        cell?.textLabel?.text = self.titles[indexPath.row]
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.back()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
            if self.asyncBlock != nil {
                self.asyncBlock!(indexPath)
            }
        })
    }
    
    // MARK: lazy loading
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView.init()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        return tableView
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton.init()
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        return btn
    }()
}

