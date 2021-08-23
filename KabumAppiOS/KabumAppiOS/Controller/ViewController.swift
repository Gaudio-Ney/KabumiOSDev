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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://servicespub.prod.api.aws.grupokabum.com.br/home/v1/home/produto"
        getData(from: url)
    }
    
    private func getData (from url: String) {
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print ("Something Wrong!")
                return
            }
            
            guard let request = try? Request.load(from: data) else {
                print ("Faild to convert \(String(describing: error?.localizedDescription))")
                return
            }
            dump(request)
//            request.produtos.forEach {
//                print($0.nome)
//            }
        }).resume()
    }
}
