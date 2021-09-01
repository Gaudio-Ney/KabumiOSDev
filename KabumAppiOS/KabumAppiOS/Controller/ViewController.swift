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
    var apiController: APIController?
    public var product = [Produto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://servicespub.prod.api.aws.grupokabum.com.br/home/v1/home/produto"
        getData(from: url)
        view.backgroundColor = .white
        productView.collection.dataSource = self
        view.addSubview(productView)
        setConstraints()
    }
    
    func setConstraints() {
        productView.backgroundColor = .red
        NSLayoutConstraint.activate([
            productView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            productView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            productView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            productView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
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
}
