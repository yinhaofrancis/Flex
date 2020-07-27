//
//  v.swift
//  Flex_Example
//
//  Created by hao yin on 2020/7/24.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit


extension UIView {
    static func nib(name:String)->Self?{
        return UINib (nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil).first as? Self
    }
}
