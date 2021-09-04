//
//  BuyButtonView.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 03/09/21.
//

import Foundation
import UIKit

/// Setup of the Buy Button View.
class BuyButtonView: UIButton {
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        self.titleLabel?.font = .buyButtonTitle
        self.setTitle("Comprar", for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isSelected = true
        layer.cornerRadius = 4
        backgroundColor = .primaryOrange
        setTitleColor(.white, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
