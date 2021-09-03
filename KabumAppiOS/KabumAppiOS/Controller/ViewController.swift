//
//  ViewController.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 22/08/21.
//
/*
 
 */

import UIKit

class ViewController: UIViewController {
    
    var productView = ProductView(frame: .zero)
    public var product = [Produto]()
    public var manufacturer = [Fabricante]()
    
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
    
    public func getData (from url: String) {
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print ("Something Wrong!")
                return
            }
            
            guard let request = try? Request.load(from: data) else {
                print ("Faild to convert \(String(describing: error?.localizedDescription))")
                return
            }
            
            request.produtos.forEach {_ in self.product.append(contentsOf: request.produtos)}
            self.onLoad()
            dump(self.product)
        }).resume()
    }
    
    func onLoad() {
        DispatchQueue.main.async {
            self.productView.collection.reloadData()
        }
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? ProductCollectionViewCell else { fatalError("Faild loading ProductCollectionViewCell") }
        cell.updateCellProperties(self.product[indexPath.row])
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        ///TO DO: Check if the header is a CollectionView.
//        return nil
//    }
}

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
