//
//  DataProvider.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 28/09/21.
//

import Foundation

class DataProvider {
    
    private init() {}

    static let shared = DataProvider()
    
    private let apiURL = "https://servicespub.prod.api.aws.grupokabum.com.br/home/v1/home/produto?app:1"
    
    //MARK: - Public Methods
    
    ///Function that loads the data and tries to convert it to
    /// - Parameter url: url that opens the JASON API.
    public func getData (completion: @escaping(_ products: [Produto]?) -> ()) {
        URLSession.shared.dataTask(with: URL(string: apiURL)!, completionHandler: {data, response, error in
            
            ///Tries to access the url Data and hold it at data variable in Swift.
            guard let data = data, error == nil else {
                print ("Faild to access the URL data provided. Pleas check if the link still online and working well.")
                completion(nil)
                return
            }
            
            ////Tries to convert (Decode) the data (Json) to the Structs created based in the Json Properties and hold it at resques variable.
            guard let request = try? Request.load(from: data) else {
                print ("Faild to convert \(String(describing: error?.localizedDescription))")
                completion(nil)
                return
            }
            var fetchedProducts: [Produto] = []
            ///Add each item of products provided by the request into the Array (product) of Produtos.
            request.produtos.forEach {_ in fetchedProducts.append(contentsOf: request.produtos)}
            
            ///Call the funcition thar reload the data async.
            
            completion(fetchedProducts)
        }).resume()
    }
}
