//
//  CodeView.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 02/09/21.
//

import Foundation


/// Protocol that set the necessary functions to build UIViews Hierarchy,  Constraints and Additional Configurations.
protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {}
}
