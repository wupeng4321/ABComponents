//
//  ABIconFontModel.swift
//  AppBook
//
//  Created by wupeng on 2020/10/30.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import HandyJSON


class ABIconFontModel: HandyJSON {
    required init() {}
    var icon_id = ""
    var name: String = ""
    var font_class: String = ""
    var unicode: String = ""
    var unicode_decimal: String = ""
}


class ABIconFontInfoModel: HandyJSON {
    required init() {}
    var id = "2156382"
    var name: String = "AppBook"
    var font_family: String = "iconfont"
    var css_prefix_text: String = "icon-"
    var description: String = ""
    
    var glyphs: [ABIconFontModel] = []
    
}
