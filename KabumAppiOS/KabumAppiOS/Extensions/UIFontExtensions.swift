//
//  UIFontExtensions.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 01/09/21.
//

import UIKit

extension UIFont {
    
    public class var manufacturerTitle: UIFont {
        if let descriptor = UIFont.systemFont(ofSize: 15, weight: .medium).fontDescriptor.withDesign(.rounded) {
            return UIFontMetrics.default.scaledFont(for: UIFont(descriptor: descriptor, size: 15))
        } else {
            return UIFont.systemFont(ofSize: 15, weight: .regular)
        }
    }
    
    /// Returns the "Product Title" UIFont configuration.
    public class var productTitle: UIFont {
        if let descriptor = UIFont.systemFont(ofSize: 20, weight: .bold).fontDescriptor.withDesign(.rounded) {
            return UIFontMetrics.default.scaledFont(for: UIFont(descriptor: descriptor, size: 20))
        } else {
            return UIFont.systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    public class var productValue: UIFont {
        if let descriptor = UIFont.systemFont(ofSize: 20, weight: .medium).fontDescriptor.withDesign(.rounded) {
            return UIFontMetrics.default.scaledFont(for: UIFont(descriptor: descriptor, size: 20))
        } else {
            return UIFont.systemFont(ofSize: 20, weight: .medium)
        }
    }
}
