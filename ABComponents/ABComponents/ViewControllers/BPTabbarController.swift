//
//  BPTabBarController.swift
//  ABComponents
//
//  Created by wupeng on 2020/10/23.
//  Copyright © 2020 wupeng. All rights reserved.
//

import UIKit
import Foundation
import BPComponents

open class BPTabbarController: UITabBarController {
    public init() {
        super.init(nibName: nil, bundle: nil)
        let tabbars: [BPTabbarModel] = self.getData()
        self.setUpAllChildViewControllers(tabbars: tabbars);
        self.tabBar.tintColor = Theme.colorTheme
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func getData() -> Array<BPTabbarModel> {
//        guard let path = Bundle.main.path(forResource: "tabbar", ofType: "json") else { return [] }
        guard let path = ABBundle.bundle.path(forResource: "tabbar", ofType: "json") else {
            return []
        }
        
        let url: URL = URL(fileURLWithPath: path)
        let data: NSData = try! Data.init(contentsOf: url) as NSData
        
        
        let jsonData: [Dictionary] = try! JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [Dictionary<String, String>]
        
        var tabbarModels: [BPTabbarModel] = []
        for dic in jsonData {
            let tabbarModel = BPTabbarModel.init()
            tabbarModel.title = dic["title"] ?? ""
            tabbarModel.clsName = dic["clsName"] ?? ""
            tabbarModel.iconfont = dic["iconfont"] ?? ""
            tabbarModels.append(tabbarModel)
        }

        return tabbarModels
    }
    
    
    func setUpAllChildViewControllers(tabbars: [BPTabbarModel]) {
        for model in tabbars {
            let clsStr = model.clsName
            let childVc = clsStr.viewController
            childVc.tabBarItem.title = model.title
            let normalImage = UIImage.iconValue(from: model.iconfont.toUnicode(), imageSize: CGSize.init(width: 24, height: 24), ofSize: 24)
            childVc.tabBarItem.image = normalImage
            let nav = UINavigationController.init(rootViewController: childVc)
            self.addChild(nav)
        }
    }
}