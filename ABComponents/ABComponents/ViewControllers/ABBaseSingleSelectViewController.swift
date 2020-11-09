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

open class ABBaseSingleSelectViewController: ABBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    open override func viewDidLoad() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(bp_screenHeight / 2)
        }
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(back))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    var titles:[String] = [] {
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
            cell?.textLabel?.textAlignment = .center
        }
        cell?.textLabel?.text = self.titles[indexPath.row]
        return cell!
    }
    
    // MARK: lazy loading
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView.init()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        return tableView
    }()
}
