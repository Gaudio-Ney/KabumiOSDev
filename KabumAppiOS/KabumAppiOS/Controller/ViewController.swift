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
        let url = "https://servicespub.prod.api.aws.grupokabum.com.br/home/v1/home/produto"
        getData(from: url)
        
        ///Set the main view background and the CollectionView color.
        view.backgroundColor = .backgroudHomeColor
        productView.backgroundColor = .backgroudHomeColor

        ///Set the data source and the delegate to the View Controller.
        productView.collection.dataSource = self
        productView.collection.delegate = self
        
        ///Register the Header of the Collection View.
        productView.collection.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader")
        
        ///Setup the SearchBar and NavigationBar configurations.
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .primaryBlue
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
    
    //MARK: - Public Methods
    
    ///Function that loads the data and tries to convert it to
    /// - Parameter url: url that opens the JASON API.
    public func getData (from url: String) {
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            ///Tries to access the url Data and hold it at data variable in Swift.
            guard let data = data, error == nil else {
                print ("Faild to access the URL data provided. Pleas check if the link still online and working well.")
                return
            }
            
            ////Tries to convert (Decode) the data (Json) to the Structs created based in the Json Properties and hold it at resques variable.
            guard let request = try? Request.load(from: data) else {
                print ("Faild to convert \(String(describing: error?.localizedDescription))")
                return
            }
            
            ///Add each item of products provided by the request into the Array (product) of Produtos.
            request.produtos.forEach {_ in self.product.append(contentsOf: request.produtos)}
            
            ///Call the funcition thar reload the data async.
            self.onLoad()
        }).resume()
    }
}
