//
//  AlertOk.swift
//  download press
//
//  Created by Moby on 8.03.22.
//

import UIKit
extension UIViewController {
    
    func alertOK(title: String, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}
