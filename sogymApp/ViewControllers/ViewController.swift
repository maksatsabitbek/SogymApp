//
//  ViewController.swift
//  sogymApp
//
//  Created by Мас on 13.06.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {


    @IBOutlet weak var segmentController: UISegmentedControl!
    
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var loginView: UIView!
    
    
    

    @IBOutlet weak var registerEmail: UITextField!
    @IBOutlet weak var registerPassword: UITextField!
    @IBOutlet weak var registerSubmit: UIButton!
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var loginSubmit: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentController(_ sender: UISegmentedControl) {
        
        switch segmentController.selectedSegmentIndex {
        case 0:
            registerView.isHidden = false
            loginView.isHidden = true
        case 1:
            registerView.isHidden = true
            loginView.isHidden = false
        default:
            print("Error")
        }
        
    }
    
    
    @IBAction func registerSubmitPressed(_ sender: Any) {
        
        guard let email = registerEmail.text else {return }
        guard let password = registerPassword.text else {return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to create user, \(error)")
            } else {
                self.performSegue(withIdentifier: "goToChatFromRegistration", sender: nil)
            }
        }
        
    }
    
    
    @IBAction func loginSubmitPressed(_ sender: Any) {
        
        guard let email = loginEmail.text else {return }
        guard let password = loginPassword.text else {return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if error != nil {
                print("Failed to Login In, \(error!)")
            } else {
                self?.performSegue(withIdentifier: "goToChatFromLogin", sender: nil)
            }
        }
        
    }
    


}

