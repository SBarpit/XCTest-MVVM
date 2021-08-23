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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = loginBtn.frame.height/2
        UITextField.appearance().tintColor = .black
        
    }
}

