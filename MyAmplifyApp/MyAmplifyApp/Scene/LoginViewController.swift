//
//  LoginViewController.swift
//  MyAmplifyApp
//
//  Created by Ragnar on 8/16/20.
//  Copyright © 2020 Ragnar. All rights reserved.
//

import UIKit
import Amplify

class LoginViewController: BaseViewController {

    // MARK: - Properties
    
    // MARK: - Outlet
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPwd: UITextField!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action
    @IBAction func btnLoginClicked(_ sender: Any) {
        let username = tfUsername.text!
        let pwd = tfPwd.text!
        
        _ = Amplify.Auth.signIn(username: username, password: pwd) { result in
            
            
            switch result {
            case .success(_):
                self.showAlertView(title: "Sign in succeeded", message: "", okTitle: "OK", cancelTitle: nil)
                print("Sign in succeeded")
            case .failure(let error):
                self.showAlertView(title: "Sign in failed. Error code: \(error.errorDescription)", message: error.errorDescription, okTitle: "OK", cancelTitle: nil)
                print("Sign in failed \(error)")
            }
        }
    }
    
    // MARK: - Method
    
}
