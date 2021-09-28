//
//  ViewController.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 22/08/21.
//

import UIKit

///ViewController of the ProductCollectionView.
class ViewController: UIViewController, CodeView, UINavigationBarDelegate {
    
    //MARK: - Properties
    
    var productView = ProductView(frame: .zero)
    
    public var product = [Produto]()
    
    public var manufacturer = [Fabricante]()
    
//TODO: set the searchBarController to show the itens in a TableView.
    //let searchBarController = UISearchController(searchResultsController: SearchResultsViewController())
    
    let searchBar = UISearchBar(frame: .zero)
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setConstraints() {
    }
    
    func onLoad() {
        DispatchQueue.main.async {
            self.productView.collection.reloadData()
        }
    }
    
    func buildViewHierarchy() {
        view.addSubview(productView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            productView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            productView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            productView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            productView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {

        ///Call the function that get the dat from the given URL.
        DataProvider.shared.getData() { [weak self] products in
            if let strongSelf = self,
                let fetchedProducts = products {
                strongSelf.product = fetchedProducts
                strongSelf.onLoad()
            }
            else {
                ///TODO: show alert.
            }
        }
        
        ///Set the main view background and the CollectionView color.
        view.backgroundColor = .backgroudHomeColor
        productView.backgroundColor = .backgroudHomeColor

        ///Set the data source and the delegate to the View Controller.
        productView.collection.dataSource = self
        productView.collection.delegate = self
        
        ///Register the Header of the Collection View.
        productView.collection.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader")
        
        ///Setup the SearchBar and NavigationBar configurations.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .primaryBlue
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.barTintColor = .primaryBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.fill"), style: .plain, target: self, action: nil)
        
        self.searchBar.delegate = self
        searchBar.tintColor = .white
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.placeholder = "Procure no KaBum!"
        navigationItem.titleView = searchBar
    }
    
    @objc func addToShopCart() {
    }
}
