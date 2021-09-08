//
//  UICollectionViewDataSource_ViewController.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 08/09/21.
//

import UIKit

///Extension of UICollectionViewDataSource that set the number of lines of the CollectionView and the Item index at each Cell.
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? ProductCollectionViewCell else { fatalError("Faild loading ProductCollectionViewCell") }
        cell.updateCellProperties(self.product[indexPath.row])
        return cell
    }

}
