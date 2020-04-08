//
//  ThoughtCell.swift
//  RNDM
//
//  Created by Viktor Yamchinov on 27.03.2020.
//  Copyright © 2020 Viktor Yamchinov. All rights reserved.
//

import UIKit
import Firebase

protocol ThoughtDelegate {
    
    func thoughtOptionsTapped(thought: Thought)
}

class ThoughtCell: UITableViewCell {
    
    @IBOutlet private weak var usernameLbl: UILabel!
    @IBOutlet private weak var timestampLbl: UILabel!
    @IBOutlet private weak var thoughtTxtLbl: UILabel!
    @IBOutlet private weak var likesImg: UIImageView!
    @IBOutlet private weak var likesNumLbl: UILabel!
    @IBOutlet private weak var commentsNumLbl: UILabel!
    @IBOutlet private weak var commentsImg: UIImageView!
    @IBOutlet weak var optionsMenu: UIImageView!
    
    private var thought: Thought!
    private var delegate: ThoughtDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        likesImg.addGestureRecognizer(tap)
        likesImg.isUserInteractionEnabled = true
    }
    
    @objc func likeTapped() {
        Firestore.firestore().collection(THOUGHTS_REF).document(thought.documentId).setData([NUM_LIKES: thought.numLikes + 1], merge: true)
    }
    
    @objc func thoughtOptionsTapped() {
        self.delegate?.thoughtOptionsTapped(thought: thought)
    }

    func configureCell(thought: Thought, delagate: ThoughtDelegate) {
        optionsMenu.isHidden = true
        self.thought = thought
        self.delegate = delagate
        self.usernameLbl.text = thought.username
        self.thoughtTxtLbl.text = thought.thoughtTxt
        self.likesNumLbl.text = String(thought.numLikes)
        self.commentsNumLbl.text = String(thought.numComments)
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, hh:mm"
        let timestamp = formatter.string(from: thought.timestamp)
        self.timestampLbl.text = timestamp
        
        if thought.userId == Auth.auth().currentUser?.uid {
            optionsMenu.isHidden = false
            optionsMenu.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(thoughtOptionsTapped))
            optionsMenu.addGestureRecognizer(tap)
        }
    }

}
