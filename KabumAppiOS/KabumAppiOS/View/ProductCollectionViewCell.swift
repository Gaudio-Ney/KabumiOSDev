//
//  ProductCollectionViewCell.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 28/08/21.
//

import Foundation
import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    public var cellSelected: Bool = false
    
    public static let identifier = "CollectionViewCell"
    
    let productDefaultImageName = "rectangle.fill"
    
    var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleToFill
        label.sizeToFit()
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleToFill
        label.sizeToFit()
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productDescriptionLabel)
        contentView.addSubview(productImage)
        layoutSubviews()
        contentView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1, constant: 0).isActive = true
        productNameLabel.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1, constant: 0).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor ).isActive = true
        productNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        productDescriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1, constant: 0).isActive = true
        productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 0 ).isActive = true
        productDescriptionLabel.bottomAnchor.constraint(equalTo: productNameLabel.topAnchor, constant: 1).isActive = true
        productDescriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1, constant: 0).isActive = true
        productImage.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 0 ).isActive = true
        productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        productImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateCellProperties(_ produto: Produto){
        productNameLabel.text = produto.nome
        productDescriptionLabel.text = produto.linkDescricao
        productImage.image = UIImage(systemName: productDefaultImageName)

//        let imageSize = 2 * Int(UIScreen.main.bounds.width / 2.5)
//        _ = produto.img.replacingOccurrences(of: "{w}", with: "\(imageSize)").replacingOccurrences(of: "{h}", with: "\(imageSize)")
    }
}
