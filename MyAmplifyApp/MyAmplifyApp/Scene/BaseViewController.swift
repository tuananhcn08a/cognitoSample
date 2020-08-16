//
//  BaseViewController.swift
//  MyAmplifyApp
//
//  Created by Ragnar on 8/16/20.
//  Copyright © 2020 Ragnar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func showAlertView(title: String, message: String, okTitle: String?, cancelTitle: String?, completion:((_ isPressedOK: Bool) -> Swift.Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if (okTitle != nil) {
            let okAction = UIAlertAction(title: okTitle, style: .default, handler: { (result: UIAlertAction) in
                print("OK")
                completion?(true)
            })
            
            alert.addAction(okAction)
        }
        
        if (cancelTitle != nil) {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .destructive, handler: { (result: UIAlertAction) in
                print("Cancel")
                completion?(false)
            })
            
            alert.addAction(cancelAction)
        }
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }

}
