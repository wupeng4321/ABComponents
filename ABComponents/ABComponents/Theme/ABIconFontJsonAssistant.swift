//
//  BPFileManager.swift
//  AppBook
//
//  Created by wupeng on 2020/10/31.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation

public func writeToCachesDirectory(_ string: String) {
    
    let dic: URL = FileManager.default.urls(for: FileManager.SearchPathDirectory.cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).last!
    let fileurl =  dic.appendingPathComponent("iconFont.txt")
    
    do {
        try string.write(to: fileurl, atomically: false, encoding: String.Encoding.utf8)
    } catch {

    }
}
