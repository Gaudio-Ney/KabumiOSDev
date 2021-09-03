//
//  ProductCollectionViewCell.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 28/08/21.
//

import Foundation
import UIKit

class ProductCollectionViewCell: UICollectionViewCell, CodeView {
    
    //MARK: - Properties
    public var cellSelected: Bool = false
    
    public static let identifier = "CollectionViewCell"
    
    let productDefaultImageName = "rectangle.fill"
    
    var manufacturerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleToFill
        label.sizeToFit()
        label.font = .manufacturerTitle
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleToFill
        label.sizeToFit()
        label.font = .productTitle
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
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
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupAdditionalConfiguration() {
        contentView.clipsToBounds = true
        manufacturerNameLabel.backgroundColor = .red
        productNameLabel.backgroundColor = .green
        productDescriptionLabel.backgroundColor = .yellow
        productImage.backgroundColor = .gray
        self.backgroundColor = .black
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(manufacturerNameLabel)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productDescriptionLabel)
        contentView.addSubview(productImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            manufacturerNameLabel.heightAnchor.constraint(equalToConstant: 15),
            manufacturerNameLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor),
            manufacturerNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            manufacturerNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            productNameLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productNameLabel.topAnchor.constraint(equalTo: manufacturerNameLabel.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            productDescriptionLabel.widthAnchor.constraint(equalToConstant: 300),
            productDescriptionLabel.heightAnchor.constraint(equalToConstant: 15),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor),
            productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10),
            productDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            productImage.widthAnchor.constraint(equalToConstant: 150),
            productImage.heightAnchor.constraint(equalToConstant: 150),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateCellProperties(_ produto: Produto){
        manufacturerNameLabel.text = produto.fabricante.nome
        productNameLabel.text = produto.nome
        productDescriptionLabel.text = "R$: \(produto.preco)"
        productImage.image = UIImage(systemName: productDefaultImageName)
        
        //        let imageSize = 2 * Int(UIScreen.main.bounds.width / 2.5)
        //        _ = produto.img.replacingOccurrences(of: "{w}", with: "\(imageSize)").replacingOccurrences(of: "{h}", with: "\(imageSize)")
    }
}
