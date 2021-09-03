//
//  UIFontExtensions.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 01/09/21.
//

import UIKit

extension UIFont {
    
    public class var manufacturerTitle: UIFont {
        if let descriptor = UIFont.systemFont(ofSize: 10, weight: .thin).fontDescriptor.withDesign(.default) {
            return UIFontMetrics.default.scaledFont(for: UIFont(descriptor: descriptor, size: 10))
        } else {
            return UIFont.systemFont(ofSize: 10, weight: .thin)
        }
    }
    
    /// Returns the "Product Title" UIFont configuration.
    public class var productTitle: UIFont {
        if let descriptor = UIFont.systemFont(ofSize: 15, weight: .medium).fontDescriptor.withDesign(.rounded) {
            return UIFontMetrics.default.scaledFont(for: UIFont(descriptor: descriptor, size: 15))
        } else {
            return UIFont.systemFont(ofSize: 15, weight: .medium)
        }
    }
    
    public class var productValue: UIFont {
        if let descriptor = UIFont.systemFont(ofSize: 15, weight: .bold).fontDescriptor.withDesign(.rounded) {
            return UIFontMetrics.default.scaledFont(for: UIFont(descriptor: descriptor, size: 15))
        } else {
            return UIFont.systemFont(ofSize: 15, weight: .bold)
        }
    }
    public class var buyButtonTitle: UIFont {
        if let descriptor = UIFont.systemFont(ofSize: 15, weight: .regular).fontDescriptor.withDesign(.rounded) {
            return UIFontMetrics.default.scaledFont(for: UIFont(descriptor: descriptor, size: 15))
        } else {
            return UIFont.systemFont(ofSize: 15, weight: .regular)
        }
    }
}
