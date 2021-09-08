//
//  UISearchResultUpdating_ViewController.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 08/09/21.
//

import UIKit

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
}
