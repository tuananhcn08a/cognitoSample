//
//  SignUpViewController.swift
//  MyAmplifyApp
//
//  Created by Ragnar on 8/16/20.
//  Copyright © 2020 Ragnar. All rights reserved.
//

import UIKit
import Amplify

class SignUpViewController: BaseViewController {

    // MARK: - Properties
    
    // MARK: - Outlet
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPwd: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action
    @IBAction func btnSignUpClicked(_ sender: Any) {
    // Trường hợp đăneg kí mà cần thêm trường j như mail, phone, address thì config thành options như này rồi truyền vào ở api dưới
        let userAttributes = [AuthUserAttribute(.email, value: tfEmail.text!)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        
        
        _ = Amplify.Auth.signUp(username: tfUsername.text!, password: tfPwd.text!, options: options) { result in
            switch result {
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                    
                    self.showAlertView(title: "Delivery details", message: String(describing: deliveryDetails), okTitle: "OK", cancelTitle: nil);
                } else {
                    print("SignUp Complete")
                    self.showAlertView(title: "SignUp Complete", message: "", okTitle: "OK", cancelTitle: nil);
                }
            case .failure(let error):
                self.showAlertView(title: "An error occurred while registering a user", message: error.errorDescription, okTitle: "OK", cancelTitle: nil);
                print("An error occurred while registering a user \(error)")
            }
        }
    }
    
    // MARK: - Method
}
