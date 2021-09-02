//
//  ProductCollectionView.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 28/08/21.
//

import Foundation
import UIKit

class ProductView: UIView {
    
    //MARK: - Properties

    public var indexPathsForSelectedItems: [IndexPath] = []
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let itemSquareSize = UIScreen.main.bounds.width
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 25, left: 16, bottom: 20, right: 16)
        layout.itemSize = CGSize(width: itemSquareSize - 26, height: 200)
        //layout.estimatedItemSize = .zero
        collection.alwaysBounceVertical = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        return collection
        
    }()
    
    //MARK: - Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collection)
        self.translatesAutoresizingMaskIntoConstraints = false
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        collection.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .blue
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            collection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collection.leftAnchor.constraint(equalTo: self.leftAnchor),
            collection.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
