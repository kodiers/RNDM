//
//  CreateUserVC.swift
//  RNDM
//
//  Created by Viktor Yamchinov on 01.04.2020.
//  Copyright © 2020 Viktor Yamchinov. All rights reserved.
//

import UIKit
import Firebase

class CreateUserVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createBtn.layer.cornerRadius = 10
        cancelBtn.layer.cornerRadius = 10
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func createTapped(_ sender: Any) {
        guard let email = emailTxt.text, let password = passwordTxt.text, let username = usernameTxt.text else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let err = error {
                debugPrint("Error creating user: \(err.localizedDescription)")
            } else {
                let changeRequest = result?.user.createProfileChangeRequest()
                changeRequest?.displayName = username
                changeRequest?.commitChanges(completion: { (error) in
                    if let err = error {
                        debugPrint((err.localizedDescription))
                    }
                })
                guard let userId = result?.user.uid else {
                    return
                }
                Firestore.firestore().collection(USERS_REF).document(userId).setData([USERNAME : username, DATE_CREATED: FieldValue.serverTimestamp()]) { (error) in
                    if let err = error {
                        debugPrint(err.localizedDescription)
                    } else {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
            
        }
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
