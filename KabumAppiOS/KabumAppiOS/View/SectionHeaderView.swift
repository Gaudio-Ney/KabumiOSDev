//
//  SectionHeaderView.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 07/09/21.
//

import UIKit

class SectionHeader: UICollectionReusableView, CodeView {
    
    
    var label: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .secondGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func buildViewHierarchy() {
        addSubview(label)
    }
    
    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        label.topAnchor.constraint(equalTo: self.topAnchor),
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
