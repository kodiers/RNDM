//
//  AddThoughtVC.swift
//  RNDM
//
//  Created by Viktor Yamchinov on 24.03.2020.
//  Copyright © 2020 Viktor Yamchinov. All rights reserved.
//

import UIKit

class AddThoughtVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var categorySegment: UISegmentedControl!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var thoughtTxt: UITextView!
    @IBOutlet weak var postBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        postBtn.layer.cornerRadius = 4
        thoughtTxt.layer.cornerRadius = 4
        thoughtTxt.text = "My random thought..."
        thoughtTxt.textColor = UIColor.lightGray
        thoughtTxt.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = UIColor.darkGray
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func postBtnTapped(_ sender: Any) {
    }
    
    @IBAction func categoryChanged(_ sender: Any) {
    }
    
}
