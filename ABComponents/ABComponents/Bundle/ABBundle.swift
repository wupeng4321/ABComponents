//
//  ABBundle.swift
//  ABComponents
//
//  Created by wupeng on 2020/11/9.
//

import Foundation

public class ABBundle: NSObject {
    public static var bundle: Bundle = {
        var bundlePathStr: String = Bundle.init(for: ABBundle.classForCoder()).resourcePath!
        bundlePathStr = bundlePathStr + "/ABComponents.bundle"
        return Bundle.init(path: bundlePathStr)!
    }()
}
