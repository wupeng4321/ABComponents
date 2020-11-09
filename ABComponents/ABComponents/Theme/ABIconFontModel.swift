//
//  ABIconFontModel.swift
//  ABComponents
//
//  Created by wupeng on 2020/10/30.
//  Copyright © 2020 wupeng. All rights reserved.
//

import Foundation
import HandyJSON


open class ABIconFontModel: HandyJSON {
    required public init() {}
    public var icon_id = ""
    public var name: String = ""
    public var font_class: String = ""
    public var unicode: String = ""
    public var unicode_decimal: String = ""
}


open class ABIconFontInfoModel: HandyJSON {
    required public init() {}
    public var id = "2156382"
    public var name: String = "AppBook"
    public var font_family: String = "iconfont"
    public var css_prefix_text: String = "icon-"
    public var description: String = ""
    
    public var glyphs: [ABIconFontModel] = []
    
}
