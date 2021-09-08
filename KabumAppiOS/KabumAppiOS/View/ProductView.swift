//
//  ProductCollectionView.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 28/08/21.
//

import UIKit

///CollectionView that shows the all the products provided by the API Request into the Collection Cells.
class ProductView: UIView, CodeView {
    
    //MARK: - Properties
    
    /// Calculated variable that setup the CollectionView properties.
    var collection: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        
        let mainScreenWidth = UIScreen.main.bounds.width
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 8
        
        layout.minimumInteritemSpacing = 8
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        layout.itemSize = CGSize(width: mainScreenWidth - 16, height: 160)
        
        collection.alwaysBounceVertical = true
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        return collection
    }()
    
    //MARK: - Methods
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupView()
    }
    
    func buildViewHierarchy() {

        ///Add the CollectionView to the respective View.
        self.addSubview(collection)
    }
    
    func setupConstraints() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                collection.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
                collection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                collection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                collection.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ]
        )
    }
    
    func setupAdditionalConfiguration() {
        
        ///Resgister of the CollectionView Cell with the specific identifier.
        collection.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        collection.backgroundColor = .clear
        
        ///Set a margin of 8 in the start and the and of the CollectionView.
        collection.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
