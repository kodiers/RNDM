//
//  CommentCell.swift
//  RNDM
//
//  Created by Viktor Yamchinov on 03.04.2020.
//  Copyright © 2020 Viktor Yamchinov. All rights reserved.
//

import UIKit
import Firebase

protocol CommentDelegate {
    func commentOptionsTapped(comment: Comment)
}

class CommentCell: UITableViewCell {
    
    @IBOutlet private weak var usernameLbl: UILabel!
    @IBOutlet private weak var timestampLbl: UILabel!
    @IBOutlet private weak var commentLbl: UILabel!
    @IBOutlet private weak var optionsMenu: UIImageView!
    
    private var comment: Comment!
    private var delegate: CommentDelegate?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(comment: Comment, delegate: CommentDelegate) {
        optionsMenu.isHidden = true
        self.comment = comment
        self.delegate = delegate
        self.usernameLbl.text = comment.username
        self.commentLbl.text = comment.commentTxt
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, hh:mm"
        let timestamp = formatter.string(from: comment.timestamp)
        self.timestampLbl.text = timestamp
        if comment.userId == Auth.auth().currentUser?.uid {
            optionsMenu.isHidden = false
            optionsMenu.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(commentOptionsTapped))
            optionsMenu.addGestureRecognizer(tap)
        }
    }
    
    @objc func commentOptionsTapped() {
        self.delegate?.commentOptionsTapped(comment: self.comment)
    }

}
