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
        label.font = .productTitle
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleToFill
        label.sizeToFit()
        label.font = .productValue
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
        NSLayoutConstraint.activate([
        productNameLabel.widthAnchor.constraint(equalToConstant: 300),
        productNameLabel.heightAnchor.constraint(equalToConstant: 15),
        productNameLabel.leftAnchor.constraint(equalTo: productImage.rightAnchor),
        productNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
        productNameLabel.bottomAnchor.constraint(equalTo: productDescriptionLabel.topAnchor)
        ])
        
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        productDescriptionLabel.widthAnchor.constraint(equalToConstant: 300),
        productDescriptionLabel.heightAnchor.constraint(equalToConstant: 15),
        productDescriptionLabel.leftAnchor.constraint(equalTo: productImage.rightAnchor),
        productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor),
        //productDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        productImage.widthAnchor.constraint(equalToConstant: 200),
        productImage.heightAnchor.constraint(equalToConstant: 200),
        productImage.topAnchor.constraint(equalTo: contentView.topAnchor),
        productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateCellProperties(_ produto: Produto){
        productNameLabel.text = produto.nome
        productDescriptionLabel.text = "R$: \(produto.preco)"
        productImage.image = UIImage(systemName: productDefaultImageName)

//        let imageSize = 2 * Int(UIScreen.main.bounds.width / 2.5)
//        _ = produto.img.replacingOccurrences(of: "{w}", with: "\(imageSize)").replacingOccurrences(of: "{h}", with: "\(imageSize)")
    }
}
