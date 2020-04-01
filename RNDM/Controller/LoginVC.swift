//
//  LoginVC.swift
//  RNDM
//
//  Created by Viktor Yamchinov on 01.04.2020.
//  Copyright © 2020 Viktor Yamchinov. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createUserBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginBtn.layer.cornerRadius = 10
        createUserBtn.layer.cornerRadius = 10
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginBtnTapped(_ sender: Any) {
        guard let email = emailTxt.text, let password = passwordTxt.text else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let err = error {
                debugPrint("Error signing in: \(err)")
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

}
