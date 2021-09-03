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
    var buyButton = BuyButtonView()
    
    var heartButton = HeartButtonView()
    
    var cartButton = ShoppingCartButtonView()
    
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
        label.textColor = .productTitleColor
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var productValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleToFill
        label.sizeToFit()
        label.font = .productValue
        label.textAlignment = .left
        label.textColor = .primaryOrange
        return label
    }()
    
    let imageContainer: UIView = {
        
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    var productImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        buyButton.addTarget(self, action: #selector(onTapBuyButton), for: .touchUpInside)
        setupView()
    }
    
    func setupAdditionalConfiguration() {
        
        ///Add corner and shadow to imageContainer"
        imageContainer.clipsToBounds = false
        imageContainer.layer.shadowColor = UIColor.black.cgColor
        imageContainer.layer.shadowOpacity = 0.5
        imageContainer.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        imageContainer.layer.shadowRadius = 2
        imageContainer.layer.masksToBounds = false
        imageContainer.layer.shadowPath = UIBezierPath(roundedRect: imageContainer.bounds, cornerRadius: 8).cgPath
        
        productImage.contentMode = .scaleToFill
        productImage.clipsToBounds = true
        productImage.layer.cornerRadius = 8
        
        ///Add corner and shadow to Cell:
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        
        productImage.backgroundColor = .secondGray
        self.backgroundColor = .backgroudCollectionCellColor
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(manufacturerNameLabel)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productValueLabel)
        contentView.addSubview(imageContainer)
        contentView.addSubview(buyButton)
        contentView.addSubview(cartButton)
        contentView.addSubview(heartButton)
        imageContainer.addSubview(productImage)
    }
    
    func setupConstraints() {
        
        ///Setup imageContainer Constraints
        NSLayoutConstraint.activate([
            imageContainer.widthAnchor.constraint(equalToConstant: 150),
            imageContainer.heightAnchor.constraint(equalToConstant: 150),
            imageContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        ///Setup image Constraints
        NSLayoutConstraint.activate([
            productImage.widthAnchor.constraint(equalTo: imageContainer.widthAnchor),
            productImage.heightAnchor.constraint(equalTo: imageContainer.heightAnchor),
            productImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            productImage.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor)
        ])
        
        ///Setup manufacturer name Constraints
        NSLayoutConstraint.activate([
            manufacturerNameLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            manufacturerNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            manufacturerNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
        ])
        
        ///Setup product name Constraints
        NSLayoutConstraint.activate([
            productNameLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            productNameLabel.topAnchor.constraint(equalTo: manufacturerNameLabel.bottomAnchor, constant: 2)
        ])
        
        ///Setup product value Constraints
        NSLayoutConstraint.activate([
            productValueLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            productValueLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            buyButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            buyButton.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8),
            buyButton.heightAnchor.constraint(equalToConstant: 24),
            buyButton.trailingAnchor.constraint(equalTo: heartButton.leadingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            heartButton.trailingAnchor.constraint(equalTo: cartButton.leadingAnchor, constant: -8),
            heartButton.widthAnchor.constraint(equalToConstant: 24),
            heartButton.heightAnchor.constraint(equalToConstant: 24),
            heartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)

        ])
        
        NSLayoutConstraint.activate([
            cartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            cartButton.widthAnchor.constraint(equalToConstant: 24),
            cartButton.heightAnchor.constraint(equalToConstant: 24),
            cartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    @objc func onTapBuyButton() {
        
        buyButton.isSelected.toggle()
        buyButton.backgroundColor = buyButton.isSelected ? .primaryOrange : .secondGray
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateCellProperties(_ produto: Produto){
        manufacturerNameLabel.text = produto.fabricante.nome.uppercased()
        productNameLabel.text = produto.nome
        productValueLabel.text = "R$: \(produto.preco)"
        productImage.load(url: URL(string: produto.img)!)
        
        //        let imageSize = 2 * Int(UIScreen.main.bounds.width / 2.5)
        //        _ = produto.img.replacingOccurrences(of: "{w}", with: "\(imageSize)").replacingOccurrences(of: "{h}", with: "\(imageSize)")
    }
}
