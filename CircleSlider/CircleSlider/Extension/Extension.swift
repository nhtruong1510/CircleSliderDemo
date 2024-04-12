//
//  Extension.swift
//  CircleSlider
//
//  Created by Truong Nguyen Huu on 12/4/24.
//

import Foundation
import UIKit

public func castToString(_ data: Any?) -> String {
    if let data = data {
        return "\(data)"
    }
    return ""
}

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(value) {
            layer.cornerRadius = value
        }
    }
}
