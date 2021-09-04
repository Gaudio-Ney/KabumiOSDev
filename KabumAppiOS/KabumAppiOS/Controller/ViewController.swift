//
//  ViewController.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 22/08/21.
//


import UIKit

///ViewController of the ProductCollectionView.
class ViewController: UIViewController {
    
    //MARK: - Properties

    var productView = ProductView(frame: .zero)
   
    public var product = [Produto]()
    
    public var manufacturer = [Fabricante]()
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Em destaque"
        navigationController?.navigationBar.prefersLargeTitles = true
    
        let url = "https://servicespub.prod.api.aws.grupokabum.com.br/home/v1/home/produto"
        getData(from: url)
        view.backgroundColor = .backgroudHomeColor
        productView.collection.dataSource = self
        
        view.addSubview(productView)
        setConstraints()
    }
    
    func setConstraints() {
        productView.backgroundColor = .backgroudHomeColor
        NSLayoutConstraint.activate([
            productView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 8),
            productView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            productView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            productView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func onLoad() {
        DispatchQueue.main.async {
            self.productView.collection.reloadData()
        }
    }
    
    //MARK: - Public Methods
    
    ///
    ///
    /// - Parameter url: url that opens the Jason API.
    public func getData (from url: String) {
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            ///Tries to access the url Data and hold it at data variable in Swift.
            guard let data = data, error == nil else {
                print ("Faild to access the URL data provided. Pleas check if the link still online and working well.")
                return
            }
            
            ////Tries to convert the data to a Json format and hold it at resques variable.
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

// MARK: - Extensions

///Extension of UICollectionViewDataSource that set the number of lines of the CollectionView and the Item index at each Cell.
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? ProductCollectionViewCell else { fatalError("Faild loading ProductCollectionViewCell") }
        cell.updateCellProperties(self.product[indexPath.row])
        return cell
    }

    //TODO: - Check if the header is a CollectionView.
    
//    func collectionView(
//    _ collectionView: UICollectionView,
//    viewForSupplementaryElementOfKind kind: String,
//    at indexPath: IndexPath
//    ) -> UICollectionReusableView {
//        return nil
//    }
}

///Try to catch and convert the Image URL (as a String) to a UIImage.
///And make it async only not in the Main thread.
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
