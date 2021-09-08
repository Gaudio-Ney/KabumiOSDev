//
//  URLImageExtension.swift
//  KabumAppiOS
//
//  Created by Gáudio Ney on 08/09/21.
//

import UIKit

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
