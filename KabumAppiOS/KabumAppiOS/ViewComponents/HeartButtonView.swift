//
//  HeartButtonView.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 03/09/21.
//

import Foundation

import UIKit

/// Setup of the Heart Button View .
class HeartButtonView: UIButton {
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        self.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isSelected = true
        tintColor = .secondGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
