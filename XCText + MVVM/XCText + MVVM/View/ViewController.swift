//
//  ViewController.swift
//  XCText + MVVM
//
//  Created by Admin on 23/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    var validationService:ValidationService!
    
    init( service:ValidationService) {
        super.init(nibName: nil, bundle: nil)
        self.validationService = ValidationService()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    required init?(coder:NSCoder) {
        super.init(coder:coder)
        validationService = ValidationService()
    }
    
    private func initialSetup(){
        loginBtn.layer.cornerRadius = loginBtn.frame.height/2
        UITextField.appearance().tintColor = .black
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        do {
            let fullName = try validationService.validateFullName(fullNameTF.text)
            let email = try validationService.validateEmail(emailTF.text)
            let username = try validationService.validateUsername(userNameTF.text)
            let password = try validationService.validatePassword(passwordTF.text)
            presentAlert(with: "You successfully logged in as \(username)")
        } catch {
            present(error)
        }
    }
}


